#include <stdio.h>



void nline(char *strA, unsigned long nmrA, char radA){
    
    printf(strA); printf(" ");
        
    if(radA==10){
            printf("%d\n",nmrA);
    }else if(radA==16){
            printf("0x%08x\n",nmrA);
    }else if(radA==2){
        //printf(B_to_bin(nmrA));
        bin(nmrA);
        printf("\n");
    }
}



void bin(int n)
{
 /* step 1 */
 if (n > 1)
     bin(n/2);
 /* step 2 */
 printf("%d", n % 2);
}














//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
/////LED GPIO/////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

#include <fcntl.h>
#include <linux/fs.h>
/*SET GPIO */
void LEDred(int value)
{
    int fd;
    char buf[50];
	sprintf(buf, "/sys/class/gpio_sw/PA15/data");
	fd = open(buf, O_WRONLY);
	sprintf(buf, "%d", value);
	write(fd, buf, 1);
	close(fd);
}
void LEDgrn(int value)
{
    int fd;
    char buf[50];
	sprintf(buf, "/sys/class/gpio_sw/PL10/data");
	fd = open(buf, O_WRONLY);
	sprintf(buf, "%d", value);
	write(fd, buf, 1);
	close(fd);
}