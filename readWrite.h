
//Convert data file text in plain text 
int conf2dump( char filename[] )
{
    char cmd[1000];
    /*
      sprintf( cmd, 
    "grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump", 
	filename, filename );
    */
    sprintf( cmd, 
	     "grep -v \"#\" %s | grep -v \"^$\" | awk -F\"=\" '{print $2}' > %s.dump", 
	     filename, filename );
    system( cmd );

    return 0;
}

/*************************************************************/




/*************************************************************/

			//Read file with and load information  

int read_parameters( char filename[] )
{
    char cmd[1000], filenamedump[1000];
    FILE *file;

    //Loading the file
    printf("Filename: %s\n", filename);
    file = fopen( filename, "r" );
    if( file==NULL )
      {
	printf( "  * The file '%s' doesn't exist!\n", filename );
	return 1;
      }
    fclose(file);
    
    //Converting to plain text
    printf("Converting to plain text\n");
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
  //outFile = fopen("./../../Processed_data/CIC_DenCon_field_256.bin", "w");
  outFile = fopen("./../../Processed_data/CIC_vel_field_test256.bin", "w");
  
  /*+++++ Saving Simulation parameters +++++*/
  fwrite(&GV.L, sizeof(double), 1, outFile);  //Box Size
  fwrite(&GV.OmegaM0, sizeof(double), 1, outFile);  //Matter density parameter
  fwrite(&GV.OmegaL0, sizeof(double), 1, outFile);  //Cosmological constant density parameter
  fwrite(&GV.zRS, sizeof(double), 1, outFile);  //Redshift
  fwrite(&GV.HubbleParam, sizeof(double), 1, outFile);  //Hubble parameter

  printf("Ntotalgrid=%15d\n", GV.NGRID3);
  for(i=0; i<GV.NGRID3; i++ )
    {     
      /*----- Positions -----*/
      pos_aux[X] = cells[i].pos[X];
      pos_aux[Y] = cells[i].pos[Y];
      pos_aux[Z] = cells[i].pos[Z];

      fwrite(&pos_aux[0], sizeof(double), 3, outFile);

      /*----- Momentum -----*/
      momentum_aux[X] = cells[i].momentum_p[X];
      momentum_aux[Y] = cells[i].momentum_p[Y];
      momentum_aux[Z] = cells[i].momentum_p[Z];

      fwrite(&momentum_aux[0], sizeof(double), 3, outFile);

      /*----- Density contrast -----*/
      fwrite(&cells[i].denCon, sizeof(double), 1, outFile);
    }//for i
  
  fclose(outFile);
  return 0;
}//write_binary


/****************************************************************************************************          
NAME: write_binary_parts                                                                                            
FUNCTION: Writes binary data file with positions and velocities of some particles to make a test.
INPUT: none                                                                                                 
RETURN: 0                                                                                                    
****************************************************************************************************/

int write_binary_parts(void)
{
  int i, nread;
  double pos_aux[3];
  double momentum_aux[3];
  FILE *outFile=NULL;
  int counter_b = 0;

  outFile = fopen("./../../Processed_data/Particles_pos_vels_test.bin", "w");
  

  for(i=0; i<GV.NpTot; i++ )
    {     
      
      if(part[i].posz <= 40.0)
	{
	  /*----- Positions -----*/
	  pos_aux[X] = part[i].posx;
	  pos_aux[X] = part[i].posx;
	  pos_aux[X] = part[i].posx;
	  
	  fwrite(&pos_aux[0], sizeof(double), 3, outFile);
	  
	  momentum_aux[X] = part[i].velx;
	  momentum_aux[Y] = part[i].vely;
	  momentum_aux[Z] = part[i].velz;

	  /*----- Momentum -----*/	  
	  fwrite(&momentum_aux[0], sizeof(double), 3, outFile);	  
	  counter_b += 1;
	}//if
      
    }//for i
  
  printf("????????????????????????????????????????????????????????????????\n");
  printf("Number of particles for velocity test: %16d\n", counter);
  printf("????????????????????????????????????????????????????????????????\n");
  
  fclose(outFile);
  return 0;
}//write_binary_parts


