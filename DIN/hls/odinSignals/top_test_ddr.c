#include<stdio.h>
#include<stdlib.h>
//int eventout(volatile float * data_ptr,volatile float * data,int read_loc,int write_loc,int *index);
int main(){
//	char buf[16];
//	int a=0;
//	a=sizeof(buf);
	return 0;
}
/**
 int event_num,c;
	int addr_data,addr_req,addr_ack;
	volatile float * PL_read_ptr;
	float addrdata=10;
	int addrindex=0;
	//1111111111111111111111111111111111111111111111111111111111111111111111111111
	FILE *fid;
	fid = fopen("F:\\sample.txt","rt");
	if(fid == NULL)
	{
		printf("file error");
		return;
	}
	rewind (fid);
	while((c = fgetc(fid)) != EOF){
		if(c =='\n')//碰到换行符，则行数+1
			event_num++;
	}
	//1111111111111111111111111111111111111111111111111111111111111111111111111111
	PL_read_ptr=(volatile int *)malloc(sizeof(int)*event_num);
	if (PL_read_ptr == NULL){
		printf("PL_read_ptr error");
		return;
	}
	rewind (fid);
	char str[17];

	int index=0;
	while(fscanf(fid,"%[^\n]",str)!=EOF){
		PL_read_ptr[index++]=strtol(str,NULL,2);
		fgetc(fid);
//		printf("data is %s\n",str);
	}
	fclose(fid);
	printf("PS write on PL read loc SUCCESS!\n");

	int result=eventout(PL_read_ptr,&addrdata,0,5,&addrindex);
	printf("over");

	free(PL_read_ptr);     //释放内存
 * */
