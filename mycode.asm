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

nlineCurV       db 13, 10, "$"   
welcome db 10,13,10,13, 'WELCOME TO MEDICAL STORE$'
msg1 db 10,13,10,13, 'Choose a Option$'
msg_medicines db 10,13, 'Press 1 to buy medicines$'
medicines_sold db 10,13, 'Press 2 to see medicines statistics$'
opt1 db 10,13, '1. Panadol - 20b$'
opt2 db 10,13, '2. Paracetamol - 30b$'
opt3 db 10,13, '3. Cleritek - 20b$'
opt4 db 10,13, '4. Aspirin - 50b$'
opt5 db 10,13, '5. Brufen - 100b$'
opt6 db 10,13, '6. Surbex Z - 80b$'
opt7 db 10,13, '7. Arinac - 40b$'
opt8 db 10,13, '8. Sinopharm Vaccine - 10b$'
opt9 db 10,13, '9. Pfizer Vaccine - 20b$'
newLine db 10,13, '$'
input_again db 10,13, 'Please Press one of the above given keys$'
wrong_input db 10,13, 'Wrong Input$'
exit_program db 10,13,'Press 4 to exit$'
amount_print db 10,13,'Press 3 to show amount earned today$'
   
   
.code 
main proc
     mov ax,@data
     mov ds,ax   
       

     start:
     lea dx, banner1
mov ah,9
    int 21h
lea dx, nlineCurV
    mov ah,9
    int 21h

lea dx, banner2
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h

lea dx, banner3
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h

lea dx, banner4
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h

lea dx, banner5
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h

lea dx, banner6
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h

lea dx, banner7
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
    int 21h
lea dx, nlineCurV
mov ah,9
   int 21h
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
    je exit
    
    mov dx,offset wrong_input
    mov ah,9
    int 21h
    mov dx,offset input_again
    mov ah,9
    int 21h    
    jmp start
    
    
    menu proc
        mov dx,offset welcome
        mov ah,9
        int 21h
        
        mov dx,offset msg1
        mov ah,9
        int 21h
        
        mov dx,offset msg_medicines
        mov ah,9
        int 21h
        
        mov dx,offset medicines_sold
        mov ah,9
        int 21h
        
        mov dx,offset amount_print
        mov ah,9
        int 21h
        
        mov dx,offset exit_program
        mov ah,9
        int 21h                   
        
             
        ret
          
    menu endp
      
      
      medicines_stats: 
      show_amount:
      exit: 
