.model small

.stack 100h

.data
   
banner1 db  ' ____  __ __  ____ ____  ___ ___  ____ $'
banner2 db  '|    \|  |  |/    |    \|   |   |/    |$'
banner3 db  '|  o  )  |  |  o  |  D  ) _   _ |  o  |$'
banner4 db  '|   _/|  _  |     |    /|  \_/  |     |$'
banner5 db  '|  |  |  |  |  _  |    \|   |   |  _  |$'
banner6 db  '|  |  |  |  |  |  |  .  \   |   |  |  |$'
banner7 db  '|__|  |__|__|__|__|__|\_|___|___|__|__|$'
    
input_password db 'Please Enter Your Password$'

   password db 'azsmy$'
   incorrect_password db 10,13, 'Incorrect Password$' 
   welcome db 10,13,10,13, 'WELCOME TO MEDICAL STORE$'
   msg1 db 10,13,10,13, 'Choose a Option$'
   msg2 db 10,13,10,13, 'What Do You Want To Buy$'
   msg_medicines db 10,13, 'Press 1 to buy medicines$'
   medicines_sold db 10,13, 'Press 2 to see medicines statistics$'
   input_again db 10,13, 'Please Press one of the above given keys$'
   wrong_input db 10,13, 'Wrong Input$'
   exit_program db 10,13,'Press 6 to exit$'
   opt1 db 10,13, '1. Panadol - 20EGP$'
opt2 db 10,13, '2. Paracetamol - 30EGP$'
opt3 db 10,13, '3. Cleritek - 20EGP$'
opt4 db 10,13, '4. Aspirin - 50EGP$'
opt5 db 10,13, '5. Brufen - 70EGP$'
opt6 db 10,13, '6. Surbex Z - 80EGP$'
opt7 db 10,13, '7. Arinac - 40EGP$'
opt8 db 10,13, '8. Sinopharm Vaccine - 10EGP$'
opt9 db 10,13, '9. Pfizer Vaccine - 20EGP$'
   newLine db 10,13, '$'    
   msg_panadol db 10,13, 'How many panadols do you want to buy$'
   msg_paracetamol db 10,13, 'How many paracetamol do you want to buy$'
   msg_cleritek db 10,13, 'How many cleritek do you want to buy$'
   msg_aspirin db 10,13, 'How many aspirin do you want to buy$'
   msg_brufen db 10,13, 'How many brufen do you want to buy$'
   msg_surbex db 10,13, 'How many subex do you want to buy$'
   msg_arinac db 10,13, 'How many arinac do you want to buy$'
   msg_sinopharm db 10,13, 'How many Sinopharm Vaccine do you want to buy$'
   msg_pfizer db 10,13, 'How many Pfizer Vaccine do you want to buy$'
   total_msg dw 'Total Earned= $'
   price_panadol dd 20
   price_paracetamol dd 30
   price_cleritek dd 20    
   price_aspirin dd 50
   price_brufen dd 70
   price_surbex dd 80    
   price_arinac dd 40
   price_sinopharm dd 10
   price_pfizer dd 20     
   amount_print db 10,13,'Press 3 to show amount earned today$'
   panadol_print db 10,13, 'Panadols sold = $'
   pfizer_print db 10,13, 'Pfizer Vaccine sold = $'
   sinopharm_print db 10,13, 'Sinopharm Vaccine sold = $'
   arinac_print db 10,13, 'Arinac sold = $'
   surbex_print db 10,13, 'Surbex sold = $'
   aspirin_print db 10,13, 'Aspirin sold = $'
   brufen_print db 10,13, 'Brufen sold = $'
   cleritek_print db 10,13, 'Cleritek sold = $'
   paracetamol_print db 10,13, 'Paracetamol sold = $'
        amount dw 0

   panadol_sold db 0
   paracetamol_sold db 0
   cleritek_sold db 0
   aspirin_sold db 0
   brufen_sold db 0
   surbex_sold db 0
   arinac_sold db 0
   sinopharm_sold db 0
   pfizer_sold db 0          
   
   
   amount_earned db 10,13,'Amount earned= $'
   
   delete_medicines db 10,13, 'Press 4 to delete all medicines$'
   delete_message db 10,13, 'all medicines deleted $'
   
   product dw 0 
   
   
   filename        db "store.txt", 0
   handler         dw ?
   endl            db ' |$'
   saveMsg         db ' Your medicines have been saved to store.txt$'
   
   panadolV            db ' Panadol x $'
   ParacetamolV            db ' Paracetamol x $'
   CleritekV            db ' Cleritek x $'
   AspirinV            db ' Aspirin x $'
   BrufenV            db ' Brufen x $'
   SurbexV            db ' Surbex x $'
   ArinacV            db ' Arinac x $'
   SinopharmV            db ' Sinopharm x $'
   PfizerV            db ' Pfizer x $'
   amot            db ' amount x $'
   
   save_medicines db 10,13, 'Press 5 to save all medicines in file$'
            
.code

main proc
     mov ax,@data
     mov ds,ax 
  
            
     lea dx, banner1
mov ah,9
    int 21h
lea dx, newLine
    mov ah,9
    int 21h

lea dx, banner2
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

lea dx, banner3
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

lea dx, banner4
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

lea dx, banner5
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

lea dx, banner6
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

lea dx, banner7
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h
lea dx, newLine
mov ah,9
    int 21h

mov dx,offset input_password
    mov ah,9
    int 21h
    mov dx,offset newLine
    mov ah,9
    int 21h
    mov bx,offset password
    mov cx,5
    
    l1:
    mov ah,1
    int 21h
    cmp al,[bx]
    jne incorrect
    inc bx
    loop l1


     start:
     
    mov dx,offset newLine
    mov ah,9
    int 21h
    call menu

    mov dx,offset newLine
    mov ah,9
    int 21h    
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    je menu2  
    cmp al,'2'
    je medicines_stats
    cmp al,'3'
    je show_amount
    cmp al,'4'
    je delete
    cmp al,'5'
    je save
    cmp al,'6'
    je exit
    
    mov dx,offset wrong_input
    mov ah,9
    int 21h
    mov dx,offset input_again
    mov ah,9
    int 21h    
    jmp start   
    
    panadol:
         
        mov dx,offset msg_panadol
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add panadol_sold,al
            mov ah ,0
        mul price_panadol
        mov product , ax
        
        add amount,ax
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9
        int 21h 
        
             
        
         mov ax, product
         call print 
         
         jmp start       
    
