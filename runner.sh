#!/bin/bash
# idk why shebang though but imma follow trail

echo "--------------------------------"
echo "Running all scripts in sequence..."
echo "---------------------------------"
echo "Running Script 1"
bash script1.sh >> outputs/script1_output.txt
echo "Script 1 output saved to outputs/script1_output.txt"
echo ""
echo "Running Script 2"
bash script2.sh >> outputs/script2_output.txt
echo "Script 2 output saved to outputs/script2_output.txt"
echo ""
echo "Running Script 3"
bash script3.sh >> outputs/script3_output.txt
echo "Script 3 output saved to outputs/script3_output.txt"
echo ""
echo "Running Script 4"
bash script4.sh /var/log/auth.log >> outputs/script4_output.txt
echo "Script 4 output saved to outputs/script4_output.txt"
echo ""
echo "Running Script 5"
bash script5.sh >> outputs/script5_output.txt
echo "Script 5 output saved to outputs/script5_output.txt"
echo ""
# TODO :sysinfo using neofetch so whoever checks knows where i executed 

echo "Collecting system information"
neofetch --stdout > outputs/systeminfo.txt
echo "System info saved to outputs/systeminfo.txt"
