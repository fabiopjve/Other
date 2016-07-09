



# ----------------------------------------------------

# Metrowerks sample code

# linker command file for MC56F8013/14 EVM
# using 
#    flash pROM
#    internal xRAM 
#    Small Program Model and Small Data Model (always set for MC56F801x)

# ----------------------------------------------------



# see end of file for additional notes & revision history
# see Freescale docs for specific EVM memory map



# memory use for this LCF: 
# interrupt vectors --> flash pROM starting at zero
#      program code --> flash pROM
#         constants --> flash pROM (copied to xRAM with init)  
#      dynamic data --> flash pROM (copied to xRAM with init) 



# CodeWarrior preference settings:
#
#   M56800E Processor:
#     Small Program Model: ON
#        Large Data Model: OFF
#
#   M56800E Assembler:
#        Default Data Memory Model: 16-bit
#     Default Program Memory Model: 16-bit
#
#   M56800E Target pref panel:
#     config file: 568301x_flash.cfg





# MC56F8013/14 memory map:
# small memory model (small data model and small program model) 
# x memory above 7FFF not available with SDM


MEMORY 
{
     .p_interrupts_ROM     (RX)  : ORIGIN = 0x0000,   LENGTH = 0x005C   # reserved for interrupts
     .p_flash_ROM          (RX)  : ORIGIN = 0x005C,   LENGTH = 0x1FA4  
 
 
     # p_flash_ROM_data mirrors internal xRAM, mapping to origin and length
     # the "X" flag in "RX" tells the debugger to download to p-memory.
     # the download to p-memory is directed to the address determined by AT
     # in the section definition below. 
     
            
    .p_flash_ROM_data     (RX)  : ORIGIN = 0x0000,   LENGTH = 0x07FF   # internal xRAM mirror
                                                                       # for pROM-to-xRAM copy

     # for MC56F801x, reserved area of memory from 0x0000 to 0x07FF 
     # is mirrored to shared RAM as well.  We use this for SDM (Small Data Model). 
     
    .x_internal_RAM       (RW)  : ORIGIN = 0x0000,   LENGTH = 0x07FF  
    .reserved_1           (RW)  : ORIGIN = 0x0800,   LENGTH = 0xE800
    .x_onchip_peripherals (RW)  : ORIGIN = 0xF000,   LENGTH = 0x1000   
    .reserved_2           (RW)  : ORIGIN = 0x010000, LENGTH = 0xFEFF00 
    .x_EOnCE              (RW)  : ORIGIN = 0xFFFF00, LENGTH = 0x0000   
}






# we ensure the interrupt vector section is not deadstripped here
# the label "interrupt_vectors" comes from file 56835x_vector.asm

KEEP_SECTION{ interrupt_vectors.text}





SECTIONS 
{
    .interrupt_code :
    {
        * (interrupt_vectors.text)
       
    } > .p_interrupts_ROM
    
	

	.executing_code :
	{
		# .text sections
		    
        * (startup.text)
        * (utility.text)
		* (interrupt_routines.text)
		* (rtlib.text)
		* (fp_engine.text)
		* (.text)		
		* (user.text)	
		
		
		# save address where for the data start in pROM
		# this is already word-aligned since program is always by words
		
		__pROM_data_start = .;  
 	    

 
	} > .p_flash_ROM


     
 


# AT sets the download address
# the download stashes the data just after the program code
# as determined by our saved pROM data start variable

	.data_in_p_flash_ROM : AT(__pROM_data_start) 
	{                             
	    
	    # the data sections flashed to pROM
	    # save data start so we can copy data later to xRAM
	    
 	    __xRAM_data_start = .; 



	    # offset to ensure no vars with location zero
	    
		. = . + 2;             
 	                          	    
 	    
 	    
 	    # used if "Emit Separate Char Data Section" enabled
        * (.const.data.char)   
        * (.data.char)    
        
               
        * (.const.data) 
        * (.data)	    
	    * (fp_state.data)
		* (rtlib.data)
 	    
 	    
 	    # save data end and calculate data block size
 	    # ensure _data_size is word-aligned
 	    # since rom-to-ram copy is by word
 	    # and we could have odd-number bytes
 	    # in .data section because 56800E 
 	    # has byte addressing

 	    . = ALIGN(2);         
 	                          	                                                  


		__xRAM_data_end = .;
		__data_size = __xRAM_data_end - __xRAM_data_start;

	} > .p_flash_ROM_data	   # this section is designated as p-memory 
	                           # with X flag in the memory map
	                           # the start address and length map to 
	                           # actual internal xRAM
	
	
		
		
		
	.data : 
	{ 
		# save space for the pROM data copy           
       . = __data_size + . ;
  		
  		
         # .bss sections
        
		. = ALIGN(2);        
        * (rtlib.bss.lo)
        * (rtlib.bss)


        . = ALIGN(2);
        __bss_addr = .;
        
        # used if "Emit Separate Char Data Section" enabled
        * (.bss.char)    
        
        
        * (.bss)
        
        
        # ensure __bss_size is word-aligned
        # for bss copy routine
        
       . = ALIGN(2);
 
        __bss_end  = .;
		__bss_size = __bss_end - __bss_addr;



        # setup the heap address 
        
        . = ALIGN(4);
        __heap_addr = .;
        __heap_size = 0x100;
        __heap_end  = __heap_addr + __heap_size; 
        . = __heap_end;

		
        # setup the stack address 
        
        _min_stack_size = 0x200;
        _stack_addr = .;
        _stack_addr = __heap_end + 2;
        _stack_end  = _stack_addr + _min_stack_size;
        . = _stack_end;
        
        
        
        # used by MSL 
            
        F_heap_addr   = __heap_addr;
        F_heap_end    = __heap_end;
          
        
	    # stationery startup code uses these globals:

        F_Lstack_addr    = _stack_addr;
       
        # rom-to-ram utility
		F_Ldata_size     = __data_size;
		F_Ldata_RAM_addr = __xRAM_data_start;
		F_Ldata_ROM_addr = __pROM_data_start;
		
        F_xROM_to_xRAM   = 0x0000;
        F_pROM_to_xRAM   = 0x0001; 	# true
               
	 	# zeroBSS utility
        F_Lbss_addr   = __bss_addr;
        F_Lbss_size   = __bss_size;

 
	} > .x_internal_RAM	 	                    	
}



# -------------------------------------------------------
# additional notes:


# about the reserved sections:

# p_interrupts_RAM -- reserved in internal pRAM
# memory space reserved for interrupt vectors
# interrupt vectors must start at address zero




# about the memory map:

# SMM xRAM limit is 0x7FFF





# about LCF conventions:

# program memory (p memory)
# (RWX) read/write/execute for pRAM
# (RX) read/execute for flashed pROM

# data memory (X memory)
# (RW) read/write for xRAM
# (R)  read for data flashed xROM or reserved x memory

# LENGTH = next start address - previous
# LENGTH = 0x0000 means use all remaing memory




# about ROM-to-RAM copying at init time:

# In embedded programming, it is common for a portion of 
# a program resident in ROM to be copied into RAM at runtime.
# For starters, program variables cannot be accessed until 
# they are copied to RAM. 

# To indicate data or code that is meant to be copied 
# from ROM to RAM,the data or code is given two addresses.

# One address is the resident location in ROM (defined by 
# the linker command file). The other is the intended
# location in RAM (defined in C code where we will 
# do the actual copying).

# To create a section with the resident location in ROM 
# and an intended location in RAM, you define the two addresses 
# in the linker command file.

# Use the MEMORY segment to specify the intended RAM location,
# and the AT(address)parameter to specify the resident ROM address.


# revision history 
# --------------------------------
# 040911 R7.0  a.h, first version
# 040928 R7.0  a.h, post-beta


# -- end -- 
