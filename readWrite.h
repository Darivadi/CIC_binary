//#include "allvars.h"

/*********************************/
//	Save and read data
/*********************************/

//Convert data file text in plain text 

int conf2dump( char filename[] )
{
    char cmd[100];
    sprintf( cmd, 
    "grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump", 
	filename, filename );
    system( cmd );

    return 0;
}

/*************************************************************/



/*************************************************************/

			//Read file with and load information  

int read_parameters( char filename[] )
{
    char cmd[100], filenamedump[100];
    FILE *file;

    //Loading the file
    file = fopen( filename, "r" );
    if( file==NULL ){
	printf( "  * The file '%s' doesn't exist!\n", filename );
	return 1;}
    fclose(file);
    
    //Converting to plain text
    conf2dump( filename );
    sprintf( filenamedump, "%s.dump", filename );
    file = fopen( filenamedump, "r" );
    
    //Reading
    /*
    while( getc( file ) != EOF ){
	fscanf( file, "%f", &parameters[i] );
	i++;}
    */
    fscanf(file, "%d", &GV.NGRID);
    fscanf(file, "%s", GV.FILENAME);    

    fclose( file );
    
    printf( "  * The file '%s' has been loaded!\n", filename );

    sprintf( cmd, "rm -rf %s.dump", filename );
    system( cmd );
    
    return 0;
}



/****************************************************************************************************          
NAME: write_binary                                                                                            
FUNCTION: Writes binary data file                                                                            
INPUT: none                                                                                                 
RETURN: 0                                                                                                    
****************************************************************************************************/

int write_binary(void)
{
  int i, nread;
  double pos_aux[3];
  double momentum_aux[3];
  FILE *outFile=NULL;
  outFile = fopen("./../Processed_data/CIC_DenCon_field_256.bin", "w");
  
  /*+++++ Saving Simulation parameters +++++*/
  fwrite(&GV.L, sizeof(double), 1, outFile);  //Box Size
  fwrite(&GV.OmegaM0, sizeof(double), 1, outFile);  //Matter density parameter
  fwrite(&GV.OmegaL0, sizeof(double), 1, outFile);  //Cosmological constant density parameter
  fwrite(&GV.zRS, sizeof(double), 1, outFile);  //Redshift
  fwrite(&GV.HubbleParam, sizeof(double), 1, outFile);  //Hubble parameter
  
  for(i=0; i<GV.NGRID3; i++ )
    {     
      /*----- Positions -----*/
      pos_aux[X] = cells[i].pos[X];
      pos_aux[Y] = cells[i].pos[Y];
      pos_aux[Z] = cells[i].pos[Z];

      fwrite(&pos_aux[0], sizeof(double), 3, outFile);

      /*----- Momentum -----*/
      fwrite(&cells[i].momentum_p[0], sizeof(double), 3, outFile);

      /*----- Density contrast -----*/
      fwrite(&cells[i].denCon, sizeof(double), 1, outFile);
    }//for i
  
  fclose(outFile);
  return 0;
}//write_binary
