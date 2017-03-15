
#include <stdio.h>
#include <unistd.h>			//Used for UART
#include <fcntl.h>			//Used for UART
#include <termios.h>		//Used for UART
#include <crc16.h>		//Used for UART
#include <mydefs.h>




void uart_read(void);









int uart0_filestream = -1;


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void Xuart_init(){

uart0_filestream = open("/dev/ttyS2", O_RDWR | O_NOCTTY | O_NDELAY);		//Open in non blocking read/write mode
	if (uart0_filestream == -1)
	{
		//ERROR - CAN'T OPEN SERIAL PORT
		printf("Error - Unable to open UART.  Ensure it is not in use by another application\n");
	}
    
struct termios options;
	tcgetattr(uart0_filestream, &options);
	options.c_cflag = B115200 | CS8 | CLOCAL | CREAD;		//<Set baud rate
	options.c_iflag = IGNPAR;
	options.c_oflag = 0;
	options.c_lflag = 0;
	tcflush(uart0_filestream, TCIFLUSH);
	tcsetattr(uart0_filestream, TCSANOW, &options);
    
}




//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
#include <signal.h>
#include <fcntl.h>
struct sigaction saio;

void uart_init(){

uart0_filestream = open("/dev/ttyS2", O_RDWR | O_NOCTTY | O_NDELAY);		//Open in non blocking read/write mode
	if (uart0_filestream == -1)
	{
		//ERROR - CAN'T OPEN SERIAL PORT
		printf("Error - Unable to open UART.  Ensure it is not in use by another application\n");
	}
    
     saio.sa_handler = uart_read;
     saio.sa_flags = 0;
     saio.sa_restorer = NULL; 
     sigaction(SIGIO,&saio,NULL);
    
     fcntl(uart0_filestream, F_SETFL, FNDELAY | FASYNC);
     fcntl(uart0_filestream, F_SETOWN, getpid());
     //fcntl(uart0_filestream, F_SETFL,  O_ASYNC );
    
    
    struct termios options;
	tcgetattr(uart0_filestream, &options);
	options.c_cflag = B115200 | CS8 | CLOCAL | CREAD;		//<Set baud rate
	options.c_iflag = IGNPAR;
	options.c_oflag = 0;
	options.c_lflag = 0;
	tcflush(uart0_filestream, TCIFLUSH);
	tcsetattr(uart0_filestream, TCSANOW, &options);
    printf("UART Ready!\n");
}



	extern unsigned int moje;
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void uart_test_send(){
	unsigned char tx_buffer[20];
	unsigned char *p_tx_buffer;
	
	p_tx_buffer = &tx_buffer[0];
	*p_tx_buffer++ = 255;


	if (uart0_filestream != -1)
	{
		int count = write(uart0_filestream, &tx_buffer[0], 1);		//Filestream, bytes to write, number of bytes to write
		if (count < 0)
		{
			printf("UART TX error\n");
		}
	}else{
        printf("UART TX error\n");
    }
}


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void uart_confirm(char id){
	unsigned char buf[5];
	
    buf[0]=5;
    buf[1]=id;


	if (uart0_filestream != -1)
	{
		int count = write(uart0_filestream, &buf[0], 2);		//Filestream, bytes to write, number of bytes to write
		if (count < 0)
		{
			printf("UART TX error\n");
		}
	}else{
        printf("UART TX error\n");
    }
}


//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void uart_read(){
    //printf("Data IN\n");
    
    	if (uart0_filestream != -1)
	{
		// Read up to 255 characters from the port if they are there
		unsigned char rx_buffer[256];
		int rx_length = read(uart0_filestream, (void*)rx_buffer, 255);		//Filestream, buffer to store in, number of bytes to read (max)
		if (rx_length < 0)
		{
			//An error occured (will occur if there are no bytes)
            //printf("NO data ERR\n");
		}
		else if (rx_length == 0)
		{
			//No data waiting
            //printf("NO data ERR\n");
		}
		else
		{
			//Bytes received
            char len = rx_buffer[3];
            unsigned int crc = crc16(rx_buffer, len);
            unsigned int rec_crc=(rx_buffer[len]<<8) + rx_buffer[len+1];
            
        //nline("CRC vypocet", crc, 16);
        //nline("CRC recvd", rec_crc, 16);
            if(crc==rec_crc){
                    uart_confirm(rx_buffer[4]);

                    rx_buffer[len]=0;
                    printf("%i bytes read : %s\n", len-5, rx_buffer+6);
                    rx_buffer[len-4]=0;
                    //nline(rx_buffer+5, 0, 0);
                    //UART_CallBack(1, tmp_buf + 5, len - 5);
                    
                }else{
                    
                    //handle transfer error
                    
                }

            
            
            
		}
	}else{
        printf("UART Not Initiated\n");
    }
}