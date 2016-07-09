/* 
Arquivo de definições de registradores do 56F8013
*/

// Registradores da porta GPIOA
#define GPIOA_base 0xF100

#define GPIOA_PUR *((volatile int *)GPIOA_base)
#define GPIOA_DR *((volatile int *)GPIOA_base+1)
#define GPIOA_DDR *((volatile int *)GPIOA_base+2)
#define GPIOA_PER *((volatile int *)GPIOA_base+3)
#define GPIOA_IAR *((volatile int *)GPIOA_base+4)
#define GPIOA_IENR *((volatile int *)GPIOA_base+5)
#define GPIOA_IPOLR *((volatile int *)GPIOA_base+6)
#define GPIOA_IPR *((volatile int *)GPIOA_base+7)
#define GPIOA_IESR *((volatile int *)GPIOA_base+8)
#define GPIOA_PPMODE *((volatile int *)GPIOA_base+9)
#define GPIOA_RAWDATA *((volatile int *)GPIOA_base+10)
#define GPIOA_DRIVE *((volatile int *)GPIOA_base+11)

// Registradores da porta GPIOB
#define GPIOB_base 0xF110

#define GPIOB_PUR *((volatile int *)GPIOA_base)
#define GPIOB_DR *((volatile int *)GPIOA_base+1)
#define GPIOB_DDR *((volatile int *)GPIOA_base+2)
#define GPIOB_PER *((volatile int *)GPIOA_base+3)
#define GPIOB_IAR *((volatile int *)GPIOA_base+4)
#define GPIOB_IENR *((volatile int *)GPIOA_base+5)
#define GPIOB_IPOLR *((volatile int *)GPIOA_base+6)
#define GPIOB_IPR *((volatile int *)GPIOA_base+7)
#define GPIOB_IESR *((volatile int *)GPIOA_base+8)
#define GPIOB_PPMODE *((volatile int *)GPIOA_base+9)
#define GPIOB_RAWDATA *((volatile int *)GPIOA_base+10)
#define GPIOB_DRIVE *((volatile int *)GPIOA_base+11)

// Registradores da porta GPIOC
#define GPIOC_base 0xF120

#define GPIOC_PUR *((volatile int *)GPIOA_base)
#define GPIOC_DR *((volatile int *)GPIOA_base+1)
#define GPIOC_DDR *((volatile int *)GPIOA_base+2)
#define GPIOC_PER *((volatile int *)GPIOA_base+3)
#define GPIOC_IAR *((volatile int *)GPIOA_base+4)
#define GPIOC_IENR *((volatile int *)GPIOA_base+5)
#define GPIOC_IPOLR *((volatile int *)GPIOA_base+6)
#define GPIOC_IPR *((volatile int *)GPIOA_base+7)
#define GPIOC_IESR *((volatile int *)GPIOA_base+8)
#define GPIOC_PPMODE *((volatile int *)GPIOA_base+9)
#define GPIOC_RAWDATA *((volatile int *)GPIOA_base+10)
#define GPIOC_DRIVE *((volatile int *)GPIOA_base+11)

// Registradores da porta GPIOD
#define GPIOD_base 0xF130

#define GPIOD_PUR *((volatile int *)GPIOA_base)
#define GPIOD_DR *((volatile int *)GPIOA_base+1)
#define GPIOD_DDR *((volatile int *)GPIOA_base+2)
#define GPIOD_PER *((volatile int *)GPIOA_base+3)
#define GPIOD_IAR *((volatile int *)GPIOA_base+4)
#define GPIOD_IENR *((volatile int *)GPIOA_base+5)
#define GPIOD_IPOLR *((volatile int *)GPIOA_base+6)
#define GPIOD_IPR *((volatile int *)GPIOA_base+7)
#define GPIOD_IESR *((volatile int *)GPIOA_base+8)
#define GPIOD_PPMODE *((volatile int *)GPIOA_base+9)
#define GPIOD_RAWDATA *((volatile int *)GPIOA_base+10)
#define GPIOD_DRIVE *((volatile int *)GPIOA_base+11)