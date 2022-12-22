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
         
    paracetamol:
    
        mov dx,offset msg_paracetamol
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add paracetamol_sold,al 
            mov ah ,0
        mul price_paracetamol
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
        
                              
    
    cleritek:
        
        mov dx,offset msg_cleritek
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add cleritek_sold,al    
            mov ah ,0
        mul price_cleritek
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
        
     aspirin:
         
        mov dx,offset msg_aspirin
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add aspirin_sold,al 
            mov ah ,0
        mul price_aspirin
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
           
        brufen:
         
        mov dx,offset msg_brufen
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add brufen_sold,al  
            mov ah ,0
        mov ah ,0
        mul price_brufen
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
        
       
        surbex:
         
        mov dx,offset msg_surbex
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add surbex_sold,al     
            mov ah ,0
        mul price_surbex
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
        arinac:
         
        mov dx,offset msg_arinac
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add arinac_sold,al   
            mov ah ,0
        mul price_arinac
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
        sinopharm:
         
        mov dx,offset msg_sinopharm
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add sinopharm_sold,al 
            mov ah ,0
        mul price_sinopharm
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
     
        pfizer:
         
        mov dx,offset msg_pfizer
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1
        int 21h
        
        sub al,48
        
        add pfizer_sold,al 
            mov ah ,0
        mul price_pfizer
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
        
        main endp
        
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
        
        mov dx,offset delete_medicines
        mov ah,9
        int 21h 
        
        mov dx,offset save_medicines
        mov ah,9
        int 21h
        
        mov dx,offset exit_program
        mov ah,9
        int 21h                  
        
             
        ret  
               
    menu endp
    
          

     
     
     menu2 proc  
        
        mov dx,offset msg2
        mov ah,9
        int 21h
        
        mov dx,offset opt1
        mov ah,9
        int 21h
        
        mov dx,offset opt2
        mov ah,9
        int 21h
            
        mov dx,offset opt3
        mov ah,9
        int 21h
        
        mov dx,offset opt4
        mov ah,9
        int 21h
        
        mov dx,offset opt5
        mov ah,9
        int 21h
            
        mov dx,offset opt6
        mov ah,9         
        int 21h
        
        mov dx,offset opt7
        mov ah,9
        int 21h
        
        mov dx,offset opt8
        mov ah,9
        int 21h
            
        mov dx,offset opt9
        mov ah,9
        int 21h
        
        mov dx,offset newLine
        mov ah,9
        int 21h    
        
        mov ah,1
        int 21h       
        
        
         cmp al,'1'
        je panadol  
        cmp al,'2'
        je paracetamol
        cmp al,'3'
        je cleritek
        cmp al,'4'
        je aspirin
        cmp al,'5'
        je brufen  
        cmp al,'6'
        je surbex
        cmp al,'7'
        je arinac
        cmp al,'8'
        je sinopharm
        cmp al,'9'
        je pfizer
        
        
        
        
        ret
            
            
    menu2 endp  
     
     
print proc    
     
      

mov dx,0
mov bx,10
mov cx,0
totalpush:  
        div bx
        push dx
        mov dx,0
    
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint
               
     
     ret  
               
     print endp       
               
   
    
     show_amount proc      
      mov dx,offset amount_earned
        mov ah,9
        int 21h
         
         mov ax, amount
        call print
        jmp start
         
        ret
         show_amount endp
         
          medicines_stats proc
            mov dx,offset panadol_print
        mov ah,9
        int 21h
        
        mov al,panadol_sold  
        mov ah ,0
        mov dx,0
         call print 
        
        mov dx,offset paracetamol_print
        
        mov ah,9
        int 21h
        
        
        mov al,paracetamol_sold 
         mov ah ,0
       mov dx,0
         call print
        
        
        mov dx,offset cleritek_print
        mov ah,9
        int 21h 
        
        
        mov al,cleritek_sold  
         mov ah ,0
        mov dx,0
         call print
        
        mov dx,offset aspirin_print
        mov ah,9
        int 21h
        
        
        mov al,aspirin_sold  
         mov ah ,0
       mov dx,0
         call print
        
        
        mov dx,offset brufen_print
        mov ah,9
        int 21h
        
        
        mov al,brufen_sold  
         mov ah ,0
        mov dx,0
         call print
        
        mov dx,offset arinac_print
        mov ah,9
        int 21h
        
        
        mov al,arinac_sold 
        mov ah,0
        mov dx,0
         call print
        
        mov dx,offset pfizer_print
        mov ah,9
        int 21h
        
        
        mov al,pfizer_sold 
         mov ah ,0
        mov dx,0
         call print
        
        mov dx,offset sinopharm_print
        mov ah,9
        int 21h
                                     
        mov al,sinopharm_sold   
         mov ah ,0
       mov dx,0
         call print
        
        jmp start 
        ret 
          
    medicines_stats endp     
      
     incorrect proc
        
        
        mov dx,offset incorrect_password
        mov ah,9
        int 21h 
        mov dx,offset newLine
        jmp exit
        
      incorrect endp
     
     
      exit proc
        mov ah,2 
        mov dl, 07              
        int 21h
        int 21h 
        int 21h
         mov ah,4ch
        int 21h  
      exit endp
     
     
     delete proc 
        mov panadol_sold, 0
        mov paracetamol_sold , 0
        mov cleritek_sold , 0
        mov aspirin_sold , 0
        mov brufen_sold , 0
        mov surbex_sold , 0
        mov arinac_sold , 0
        mov sinopharm_sold , 0
        mov pfizer_sold , 0
        mov amount , 0 
        mov dx,offset delete_message
        mov ah,9
        int 21h
        
        mov dx,offset newLine
        mov ah,9
        int 21h
          
          
        jmp medicines_stats 
         
        
        ret
     
     delete endp
     
     save proc              ; proc to write output to file

        ; create file
        mov ah, 3ch
        mov cx, 0
        mov dx, offset filename
        int 21h
        
        ; preserve file handler returned
        mov handler, ax
        
        ; write to file
        
        lea dx, panadolV            ; ds:dx -> data to write
        mov bx, handler         ; file handle
        mov cx, 11              ; number of bytes to write
        mov ah, 40h             ; WRITE TO FILE OR DEVICE
        int 21h    
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset panadol_sold
        add panadol_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 15
        mov dx, offset ParacetamolV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset paracetamol_sold  
            add paracetamol_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 12
        mov dx, offset CleritekV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset cleritek_sold    
            add cleritek_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 11
        mov dx, offset AspirinV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset aspirin_sold     
            add aspirin_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 10
        mov dx, offset BrufenV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset brufen_sold 
            add brufen_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 10
        mov dx, offset SurbexV
        int 21h
        
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset surbex_sold 
            add surbex_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 10
        mov dx, offset ArinacV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset arinac_sold 
            add arinac_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 13
        mov dx, offset SinopharmV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset sinopharm_sold 
        add sinopharm_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 10
        mov dx, offset PfizerV
        int 21h
        
        mov ah, 40h
        mov bx, handler
        mov cx, 1
        mov dx, offset pfizer_sold
        add pfizer_sold ,48
        int 21h
        
        lea dx, endl
        mov bx, handler
        mov cx, 2
        mov ah, 40h
        int 21h
        
        ;lea dx, amot
        ;mov bx, handler
        ;mov cx, 10
        ;mov ah, 40h
        ;int 21h
        
        ;lea dx, amount
        ;mov bx, handler
        ;mov cx, 3
        ;mov ah, 40h
        ;int 21h
        
        ;lea dx, endl
        ;mov bx, handler
        ;mov cx, 2
        ;mov ah, 40h
        ;int 21h
        
        ; close file
        mov ah, 3eh
        mov bx, handler
        int 21h
        
        lea dx, newLine
        mov ah,9
        int 21h
        
        lea dx, saveMsg
        mov ah,9
        int 21h
        
        lea dx, newLine
        mov ah,9
        int 21h
        
        lea dx, newLine
        mov ah,9
        int 21h
        
        
        
        call exit
            
        ret          
        save endp
        
    end main
    
