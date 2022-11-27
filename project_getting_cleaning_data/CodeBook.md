Codebook
================

## Project Description

This Project was focussed on downloading an untidy dataset from the
internet and to get it to be made into a tidy dataset

## Study design and data processing

The raw data was downloaded from the url
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It was downloaded, then read into separate dataframes.The separate
dataframes were combined into one single dataframe and columns subsetted
to include only the columns that contained mean and standard deviation
of the variables.

After this, appropriate labels were added to the relevant columns and
rows. Lastly, the tidy dataframe was grouped by 2 variables and mean
applied groupwise on all the other variables

### Collection of the raw data

Description of how the data was collected. The raw data was downloaded
from the url
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

See
<https://github.com/JoelJohnThomas/datasciencecoursera/blob/main/project_getting_cleaning_data/Readme.md>
for details

### Guide to create the tidy data file

1.Download the raw data, you will get a zipped file. Unzip it to its
component files. Out of the extracted files, 6 are contributing to the
making of the tidy dataframe

2.  See few lines of the file to understand what type of file it is
    (csv, fixed width file, txt, etc)

3.Read the files into dataframes using appropriate functions

4.Combine the separate dataframes into one dataframe

5.Using appropriate methods, label the data set with descriptive
variable names.

6.Write the dataset obtained to a csv file

7.Obtain another dataset which has grouped mean taken on its variables
and write the resultant dataset to a csv file

### Cleaning of the data

See lines 64 to 77 of the url
<https://github.com/JoelJohnThomas/datasciencecoursera/blob/main/project_getting_cleaning_data/Readme.md>

## Description of the variables in the tiny_data.txt file

General description of the file including: - Dimensions of the dataset -
Summary of the data - Variables present in the dataset

``` r
df <- read.csv(file = "merged_dataframe.csv", header = TRUE)
names(df)
```

    ##  [1] "X"                           "Subject.Id"                 
    ##  [3] "Activity"                    "tBodyAcc.mean...X"          
    ##  [5] "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"          
    ##  [7] "tBodyAcc.std...X"            "tBodyAcc.std...Y"           
    ##  [9] "tBodyAcc.std...Z"            "tGravityAcc.mean...X"       
    ## [11] "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
    ## [13] "tGravityAcc.std...X"         "tGravityAcc.std...Y"        
    ## [15] "tGravityAcc.std...Z"         "tBodyAccJerk.mean...X"      
    ## [17] "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"      
    ## [19] "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"       
    ## [21] "tBodyAccJerk.std...Z"        "tBodyGyro.mean...X"         
    ## [23] "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
    ## [25] "tBodyGyro.std...X"           "tBodyGyro.std...Y"          
    ## [27] "tBodyGyro.std...Z"           "tBodyGyroJerk.mean...X"     
    ## [29] "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"     
    ## [31] "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"      
    ## [33] "tBodyGyroJerk.std...Z"       "tBodyAccMag.mean.."         
    ## [35] "tBodyAccMag.std.."           "tGravityAccMag.mean.."      
    ## [37] "tGravityAccMag.std.."        "tBodyAccJerkMag.mean.."     
    ## [39] "tBodyAccJerkMag.std.."       "tBodyGyroMag.mean.."        
    ## [41] "tBodyGyroMag.std.."          "tBodyGyroJerkMag.mean.."    
    ## [43] "tBodyGyroJerkMag.std.."      "fBodyAcc.mean...X"          
    ## [45] "fBodyAcc.mean...Y"           "fBodyAcc.mean...Z"          
    ## [47] "fBodyAcc.std...X"            "fBodyAcc.std...Y"           
    ## [49] "fBodyAcc.std...Z"            "fBodyAccJerk.mean...X"      
    ## [51] "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"      
    ## [53] "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
    ## [55] "fBodyAccJerk.std...Z"        "fBodyGyro.mean...X"         
    ## [57] "fBodyGyro.mean...Y"          "fBodyGyro.mean...Z"         
    ## [59] "fBodyGyro.std...X"           "fBodyGyro.std...Y"          
    ## [61] "fBodyGyro.std...Z"           "fBodyAccMag.mean.."         
    ## [63] "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.mean.." 
    ## [65] "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.mean.."    
    ## [67] "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.mean.."
    ## [69] "fBodyBodyGyroJerkMag.std.."

``` r
dim(df)
```

    ## [1] 10299    69

``` r
summary(df)
```

    ##        X           Subject.Id      Activity         tBodyAcc.mean...X
    ##  Min.   :    1   Min.   : 1.00   Length:10299       Min.   :-1.0000  
    ##  1st Qu.: 2576   1st Qu.: 9.00   Class :character   1st Qu.: 0.2626  
    ##  Median : 5150   Median :17.00   Mode  :character   Median : 0.2772  
    ##  Mean   : 5150   Mean   :16.15                      Mean   : 0.2743  
    ##  3rd Qu.: 7724   3rd Qu.:24.00                      3rd Qu.: 0.2884  
    ##  Max.   :10299   Max.   :30.00                      Max.   : 1.0000  
    ##  tBodyAcc.mean...Y  tBodyAcc.mean...Z  tBodyAcc.std...X  tBodyAcc.std...Y  
    ##  Min.   :-1.00000   Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.00000  
    ##  1st Qu.:-0.02490   1st Qu.:-0.12102   1st Qu.:-0.9924   1st Qu.:-0.97699  
    ##  Median :-0.01716   Median :-0.10860   Median :-0.9430   Median :-0.83503  
    ##  Mean   :-0.01774   Mean   :-0.10892   Mean   :-0.6078   Mean   :-0.51019  
    ##  3rd Qu.:-0.01062   3rd Qu.:-0.09759   3rd Qu.:-0.2503   3rd Qu.:-0.05734  
    ##  Max.   : 1.00000   Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.00000  
    ##  tBodyAcc.std...Z  tGravityAcc.mean...X tGravityAcc.mean...Y
    ##  Min.   :-1.0000   Min.   :-1.0000      Min.   :-1.000000   
    ##  1st Qu.:-0.9791   1st Qu.: 0.8117      1st Qu.:-0.242943   
    ##  Median :-0.8508   Median : 0.9218      Median :-0.143551   
    ##  Mean   :-0.6131   Mean   : 0.6692      Mean   : 0.004039   
    ##  3rd Qu.:-0.2787   3rd Qu.: 0.9547      3rd Qu.: 0.118905   
    ##  Max.   : 1.0000   Max.   : 1.0000      Max.   : 1.000000   
    ##  tGravityAcc.mean...Z tGravityAcc.std...X tGravityAcc.std...Y
    ##  Min.   :-1.00000     Min.   :-1.0000     Min.   :-1.0000    
    ##  1st Qu.:-0.11671     1st Qu.:-0.9949     1st Qu.:-0.9913    
    ##  Median : 0.03680     Median :-0.9819     Median :-0.9759    
    ##  Mean   : 0.09215     Mean   :-0.9652     Mean   :-0.9544    
    ##  3rd Qu.: 0.21621     3rd Qu.:-0.9615     3rd Qu.:-0.9464    
    ##  Max.   : 1.00000     Max.   : 1.0000     Max.   : 1.0000    
    ##  tGravityAcc.std...Z tBodyAccJerk.mean...X tBodyAccJerk.mean...Y
    ##  Min.   :-1.0000     Min.   :-1.00000      Min.   :-1.000000    
    ##  1st Qu.:-0.9866     1st Qu.: 0.06298      1st Qu.:-0.018555    
    ##  Median :-0.9665     Median : 0.07597      Median : 0.010753    
    ##  Mean   :-0.9389     Mean   : 0.07894      Mean   : 0.007948    
    ##  3rd Qu.:-0.9296     3rd Qu.: 0.09131      3rd Qu.: 0.033538    
    ##  Max.   : 1.0000     Max.   : 1.00000      Max.   : 1.000000    
    ##  tBodyAccJerk.mean...Z tBodyAccJerk.std...X tBodyAccJerk.std...Y
    ##  Min.   :-1.000000     Min.   :-1.0000      Min.   :-1.0000     
    ##  1st Qu.:-0.031552     1st Qu.:-0.9913      1st Qu.:-0.9850     
    ##  Median :-0.001159     Median :-0.9513      Median :-0.9250     
    ##  Mean   :-0.004675     Mean   :-0.6398      Mean   :-0.6080     
    ##  3rd Qu.: 0.024578     3rd Qu.:-0.2912      3rd Qu.:-0.2218     
    ##  Max.   : 1.000000     Max.   : 1.0000      Max.   : 1.0000     
    ##  tBodyAccJerk.std...Z tBodyGyro.mean...X tBodyGyro.mean...Y tBodyGyro.mean...Z
    ##  Min.   :-1.0000      Min.   :-1.00000   Min.   :-1.00000   Min.   :-1.00000  
    ##  1st Qu.:-0.9892      1st Qu.:-0.04579   1st Qu.:-0.10399   1st Qu.: 0.06485  
    ##  Median :-0.9543      Median :-0.02776   Median :-0.07477   Median : 0.08626  
    ##  Mean   :-0.7628      Mean   :-0.03098   Mean   :-0.07472   Mean   : 0.08836  
    ##  3rd Qu.:-0.5485      3rd Qu.:-0.01058   3rd Qu.:-0.05110   3rd Qu.: 0.11044  
    ##  Max.   : 1.0000      Max.   : 1.00000   Max.   : 1.00000   Max.   : 1.00000  
    ##  tBodyGyro.std...X tBodyGyro.std...Y tBodyGyro.std...Z tBodyGyroJerk.mean...X
    ##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.00000      
    ##  1st Qu.:-0.9872   1st Qu.:-0.9819   1st Qu.:-0.9850   1st Qu.:-0.11723      
    ##  Median :-0.9016   Median :-0.9106   Median :-0.8819   Median :-0.09824      
    ##  Mean   :-0.7212   Mean   :-0.6827   Mean   :-0.6537   Mean   :-0.09671      
    ##  3rd Qu.:-0.4822   3rd Qu.:-0.4461   3rd Qu.:-0.3379   3rd Qu.:-0.07930      
    ##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.00000      
    ##  tBodyGyroJerk.mean...Y tBodyGyroJerk.mean...Z tBodyGyroJerk.std...X
    ##  Min.   :-1.00000       Min.   :-1.00000       Min.   :-1.0000      
    ##  1st Qu.:-0.05868       1st Qu.:-0.07936       1st Qu.:-0.9907      
    ##  Median :-0.04056       Median :-0.05455       Median :-0.9348      
    ##  Mean   :-0.04232       Mean   :-0.05483       Mean   :-0.7313      
    ##  3rd Qu.:-0.02521       3rd Qu.:-0.03168       3rd Qu.:-0.4865      
    ##  Max.   : 1.00000       Max.   : 1.00000       Max.   : 1.0000      
    ##  tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z tBodyAccMag.mean..
    ##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000   
    ##  1st Qu.:-0.9922       1st Qu.:-0.9926       1st Qu.:-0.9819   
    ##  Median :-0.9548       Median :-0.9503       Median :-0.8746   
    ##  Mean   :-0.7861       Mean   :-0.7399       Mean   :-0.5482   
    ##  3rd Qu.:-0.6268       3rd Qu.:-0.5097       3rd Qu.:-0.1201   
    ##  Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000   
    ##  tBodyAccMag.std.. tGravityAccMag.mean.. tGravityAccMag.std..
    ##  Min.   :-1.0000   Min.   :-1.0000       Min.   :-1.0000     
    ##  1st Qu.:-0.9822   1st Qu.:-0.9819       1st Qu.:-0.9822     
    ##  Median :-0.8437   Median :-0.8746       Median :-0.8437     
    ##  Mean   :-0.5912   Mean   :-0.5482       Mean   :-0.5912     
    ##  3rd Qu.:-0.2423   3rd Qu.:-0.1201       3rd Qu.:-0.2423     
    ##  Max.   : 1.0000   Max.   : 1.0000       Max.   : 1.0000     
    ##  tBodyAccJerkMag.mean.. tBodyAccJerkMag.std.. tBodyGyroMag.mean..
    ##  Min.   :-1.0000        Min.   :-1.0000       Min.   :-1.0000    
    ##  1st Qu.:-0.9896        1st Qu.:-0.9907       1st Qu.:-0.9781    
    ##  Median :-0.9481        Median :-0.9288       Median :-0.8223    
    ##  Mean   :-0.6494        Mean   :-0.6278       Mean   :-0.6052    
    ##  3rd Qu.:-0.2956        3rd Qu.:-0.2733       3rd Qu.:-0.2454    
    ##  Max.   : 1.0000        Max.   : 1.0000       Max.   : 1.0000    
    ##  tBodyGyroMag.std.. tBodyGyroJerkMag.mean.. tBodyGyroJerkMag.std..
    ##  Min.   :-1.0000    Min.   :-1.0000         Min.   :-1.0000       
    ##  1st Qu.:-0.9775    1st Qu.:-0.9923         1st Qu.:-0.9922       
    ##  Median :-0.8259    Median :-0.9559         Median :-0.9403       
    ##  Mean   :-0.6625    Mean   :-0.7621         Mean   :-0.7780       
    ##  3rd Qu.:-0.3940    3rd Qu.:-0.5499         3rd Qu.:-0.6093       
    ##  Max.   : 1.0000    Max.   : 1.0000         Max.   : 1.0000       
    ##  fBodyAcc.mean...X fBodyAcc.mean...Y fBodyAcc.mean...Z fBodyAcc.std...X 
    ##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
    ##  1st Qu.:-0.9913   1st Qu.:-0.9792   1st Qu.:-0.9832   1st Qu.:-0.9929  
    ##  Median :-0.9456   Median :-0.8643   Median :-0.8954   Median :-0.9416  
    ##  Mean   :-0.6228   Mean   :-0.5375   Mean   :-0.6650   Mean   :-0.6034  
    ##  3rd Qu.:-0.2646   3rd Qu.:-0.1032   3rd Qu.:-0.3662   3rd Qu.:-0.2493  
    ##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
    ##  fBodyAcc.std...Y   fBodyAcc.std...Z  fBodyAccJerk.mean...X
    ##  Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000      
    ##  1st Qu.:-0.97689   1st Qu.:-0.9780   1st Qu.:-0.9912      
    ##  Median :-0.83261   Median :-0.8398   Median :-0.9516      
    ##  Mean   :-0.52842   Mean   :-0.6179   Mean   :-0.6567      
    ##  3rd Qu.:-0.09216   3rd Qu.:-0.3023   3rd Qu.:-0.3270      
    ##  Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000      
    ##  fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z fBodyAccJerk.std...X
    ##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000     
    ##  1st Qu.:-0.9848       1st Qu.:-0.9873       1st Qu.:-0.9920     
    ##  Median :-0.9257       Median :-0.9475       Median :-0.9562     
    ##  Mean   :-0.6290       Mean   :-0.7436       Mean   :-0.6550     
    ##  3rd Qu.:-0.2638       3rd Qu.:-0.5133       3rd Qu.:-0.3203     
    ##  Max.   : 1.0000       Max.   : 1.0000       Max.   : 1.0000     
    ##  fBodyAccJerk.std...Y fBodyAccJerk.std...Z fBodyGyro.mean...X
    ##  Min.   :-1.0000      Min.   :-1.0000      Min.   :-1.0000   
    ##  1st Qu.:-0.9865      1st Qu.:-0.9895      1st Qu.:-0.9853   
    ##  Median :-0.9280      Median :-0.9590      Median :-0.8917   
    ##  Mean   :-0.6122      Mean   :-0.7809      Mean   :-0.6721   
    ##  3rd Qu.:-0.2361      3rd Qu.:-0.5903      3rd Qu.:-0.3837   
    ##  Max.   : 1.0000      Max.   : 1.0000      Max.   : 1.0000   
    ##  fBodyGyro.mean...Y fBodyGyro.mean...Z fBodyGyro.std...X fBodyGyro.std...Y
    ##  Min.   :-1.0000    Min.   :-1.0000    Min.   :-1.0000   Min.   :-1.0000  
    ##  1st Qu.:-0.9847    1st Qu.:-0.9851    1st Qu.:-0.9881   1st Qu.:-0.9808  
    ##  Median :-0.9197    Median :-0.8877    Median :-0.9053   Median :-0.9061  
    ##  Mean   :-0.7062    Mean   :-0.6442    Mean   :-0.7386   Mean   :-0.6742  
    ##  3rd Qu.:-0.4735    3rd Qu.:-0.3225    3rd Qu.:-0.5225   3rd Qu.:-0.4385  
    ##  Max.   : 1.0000    Max.   : 1.0000    Max.   : 1.0000   Max.   : 1.0000  
    ##  fBodyGyro.std...Z fBodyAccMag.mean.. fBodyAccMag.std..
    ##  Min.   :-1.0000   Min.   :-1.0000    Min.   :-1.0000  
    ##  1st Qu.:-0.9862   1st Qu.:-0.9847    1st Qu.:-0.9829  
    ##  Median :-0.8915   Median :-0.8755    Median :-0.8547  
    ##  Mean   :-0.6904   Mean   :-0.5860    Mean   :-0.6595  
    ##  3rd Qu.:-0.4168   3rd Qu.:-0.2173    3rd Qu.:-0.3823  
    ##  Max.   : 1.0000   Max.   : 1.0000    Max.   : 1.0000  
    ##  fBodyBodyAccJerkMag.mean.. fBodyBodyAccJerkMag.std.. fBodyBodyGyroMag.mean..
    ##  Min.   :-1.0000            Min.   :-1.0000           Min.   :-1.0000        
    ##  1st Qu.:-0.9898            1st Qu.:-0.9907           1st Qu.:-0.9825        
    ##  Median :-0.9290            Median :-0.9255           Median :-0.8756        
    ##  Mean   :-0.6208            Mean   :-0.6401           Mean   :-0.6974        
    ##  3rd Qu.:-0.2600            3rd Qu.:-0.3082           3rd Qu.:-0.4514        
    ##  Max.   : 1.0000            Max.   : 1.0000           Max.   : 1.0000        
    ##  fBodyBodyGyroMag.std.. fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std..
    ##  Min.   :-1.0000        Min.   :-1.0000             Min.   :-1.0000           
    ##  1st Qu.:-0.9781        1st Qu.:-0.9921             1st Qu.:-0.9926           
    ##  Median :-0.8275        Median :-0.9453             Median :-0.9382           
    ##  Mean   :-0.7000        Mean   :-0.7798             Mean   :-0.7922           
    ##  3rd Qu.:-0.4713        3rd Qu.:-0.6122             3rd Qu.:-0.6437           
    ##  Max.   : 1.0000        Max.   : 1.0000             Max.   : 1.0000

### Variables in the dataset

Variables are normalized and bounded within \[-1,1\]

``` r
var <- names(df)
classes <- class(names(df))

print(data.frame(var, classes))
```

    ##                            var   classes
    ## 1                            X character
    ## 2                   Subject.Id character
    ## 3                     Activity character
    ## 4            tBodyAcc.mean...X character
    ## 5            tBodyAcc.mean...Y character
    ## 6            tBodyAcc.mean...Z character
    ## 7             tBodyAcc.std...X character
    ## 8             tBodyAcc.std...Y character
    ## 9             tBodyAcc.std...Z character
    ## 10        tGravityAcc.mean...X character
    ## 11        tGravityAcc.mean...Y character
    ## 12        tGravityAcc.mean...Z character
    ## 13         tGravityAcc.std...X character
    ## 14         tGravityAcc.std...Y character
    ## 15         tGravityAcc.std...Z character
    ## 16       tBodyAccJerk.mean...X character
    ## 17       tBodyAccJerk.mean...Y character
    ## 18       tBodyAccJerk.mean...Z character
    ## 19        tBodyAccJerk.std...X character
    ## 20        tBodyAccJerk.std...Y character
    ## 21        tBodyAccJerk.std...Z character
    ## 22          tBodyGyro.mean...X character
    ## 23          tBodyGyro.mean...Y character
    ## 24          tBodyGyro.mean...Z character
    ## 25           tBodyGyro.std...X character
    ## 26           tBodyGyro.std...Y character
    ## 27           tBodyGyro.std...Z character
    ## 28      tBodyGyroJerk.mean...X character
    ## 29      tBodyGyroJerk.mean...Y character
    ## 30      tBodyGyroJerk.mean...Z character
    ## 31       tBodyGyroJerk.std...X character
    ## 32       tBodyGyroJerk.std...Y character
    ## 33       tBodyGyroJerk.std...Z character
    ## 34          tBodyAccMag.mean.. character
    ## 35           tBodyAccMag.std.. character
    ## 36       tGravityAccMag.mean.. character
    ## 37        tGravityAccMag.std.. character
    ## 38      tBodyAccJerkMag.mean.. character
    ## 39       tBodyAccJerkMag.std.. character
    ## 40         tBodyGyroMag.mean.. character
    ## 41          tBodyGyroMag.std.. character
    ## 42     tBodyGyroJerkMag.mean.. character
    ## 43      tBodyGyroJerkMag.std.. character
    ## 44           fBodyAcc.mean...X character
    ## 45           fBodyAcc.mean...Y character
    ## 46           fBodyAcc.mean...Z character
    ## 47            fBodyAcc.std...X character
    ## 48            fBodyAcc.std...Y character
    ## 49            fBodyAcc.std...Z character
    ## 50       fBodyAccJerk.mean...X character
    ## 51       fBodyAccJerk.mean...Y character
    ## 52       fBodyAccJerk.mean...Z character
    ## 53        fBodyAccJerk.std...X character
    ## 54        fBodyAccJerk.std...Y character
    ## 55        fBodyAccJerk.std...Z character
    ## 56          fBodyGyro.mean...X character
    ## 57          fBodyGyro.mean...Y character
    ## 58          fBodyGyro.mean...Z character
    ## 59           fBodyGyro.std...X character
    ## 60           fBodyGyro.std...Y character
    ## 61           fBodyGyro.std...Z character
    ## 62          fBodyAccMag.mean.. character
    ## 63           fBodyAccMag.std.. character
    ## 64  fBodyBodyAccJerkMag.mean.. character
    ## 65   fBodyBodyAccJerkMag.std.. character
    ## 66     fBodyBodyGyroMag.mean.. character
    ## 67      fBodyBodyGyroMag.std.. character
    ## 68 fBodyBodyGyroJerkMag.mean.. character
    ## 69  fBodyBodyGyroJerkMag.std.. character
