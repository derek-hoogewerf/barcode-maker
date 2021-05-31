function EncodeCode39(data,checkDigit)
          {
              var fontOutput = ConnectCode_Encode_Code39(data,checkDigit);
              var output = "";
              var pattern = "";
              for (x = 0; x < fontOutput.length; x++)
              {
                  switch (fontOutput.substr(x,1))
                  {
                      case '1':
                          pattern = "wttwttttwt";
                          break;
                      case '2':
                          pattern = "ttwwttttwt";
                          break;
                      case '3':
                          pattern = "wtwwtttttt";
              .
              .
              .
              .
              .
                      case 'Z':
                          pattern = "twwtwttttt";
                          break;
              default : break;
                  }
                  output=output+pattern;
              }
              return output;
          }