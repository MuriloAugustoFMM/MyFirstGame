
// Project: ProjetoAlexandre 
// Created: 2024-07-02

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "ProjetoAlexandre" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
SetWindowTitle("jose salvation")


//inicialização do jogo

//variavel de tempo jogando
global time = 0
global timef = 0

//segundos
global segundos = 0


//variavel do menu
global menuscreen = 1
//variavel de inicio do jogo
global startGame = 0

//variavel do pulo
global jump = 0

//altura do pulo
global jumpheight = 635

//variavel final cristão
global heaven = 0

//variavel final inferno
global hell = 0

//variavel inimigo
global inimigo = 0

//variavel de controle de posição do inimigo
global invoca = 1

//final
global final = 0

//toca o som startbutton
global playst = 1

//toca o som exitbutton
global playxt = 1

//mobilidade do inimigo
global inimigovel = 0

//controle do som do passarinho
global birdsoundplayed = 0

//controle de animação
global animationplayed = 0

//controle animação
global inimigoAnima = 0

//bordas
global bordax1 = 0 
global bordax2 = 980

//Final do inferno
global hellFinal = 0

//final do ceu
global heavenFinal = 0

//imagem bola de fogo
global bolafAImage 
bolafAImage = LoadImage("bolaf.png")





//variaveis do inferno
global demonMov = 0
global demonSpeed = 5
global bola = 0
global mov = 0
global sofrimento = 0

//variaveis do ceu
global stophouse = 0
global stopchair = 0
global moveX = 0
global movey = 0



//carrega o menu do jogo
menu()

do
	
	MenuOnOff(menuscreen)
	//animação do titulo
	Gaming(startGame)
	Final(heaven,hell)
	HellHeavenFinal(hellFinal, heavenFinal)
	
	
	

	
    

   
    Sync()
loop

function PlayerRunning()
	global spritePersonagemPrincipalCorrendo
	imagemPersonagemPrincipalCorrendo = LoadImage("MainRunning1.png")
	spritePersonagemPrincipalCorrendo = CreateSprite(imagemPersonagemPrincipalCorrendo)
	SetSpritePosition(spritePersonagemPrincipalCorrendo,10,635)
	SetSpriteAnimation(spritePersonagemPrincipalCorrendo,54,68,10)
	PlaySprite(spritePersonagemPrincipalCorrendo,15,1,1,10)
Endfunction

function PlayerMobility()
	
if (GetRawKeyState(87) and GetSpriteY(spritePersonagemPrincipalCorrendo) = jumpheight )
//W	
	PlaySound(jumpSound,50)
	jump = 1
endif
if GetRawKeyState(65)
	//A
	
	SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo) - 15, GetSpriteY(spritePersonagemPrincipalCorrendo))
	
endif
if GetRawKeyState(68)
	//D
	
	SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo) + 15, GetSpriteY(spritePersonagemPrincipalCorrendo))
	
endif


	

Endfunction

function BackgroundRunning()
	global groundSpeed = 10
	global groundX = 0
	global spriteDoFundoCorrendo
	Tree()
	imagemDeFundoLoad = LoadImage("fundocorrendo2.png")
	spriteDoFundoCorrendo = CreateSprite(imagemDeFundoLoad)
	SetSpritePosition(spriteDoFundoCorrendo,groundX,699)
endFunction

function Fundo()
	global spriteFundoA
	imageFundoA = LoadImage("fundoI.png")
	spriteFundoA = CreateSprite(imageFundoA)
	//
	SetSpriteDepth(spriteFundoA,15)

endfunction

function FundoMoving()
		SetSpritePosition(spriteFundoA,GetSpriteX(spriteFundoA) -5,GetSpriteY(spriteFundoA))
		if(GetSpriteX(spriteFundoA) < -1015)
			SetSpritePosition(spriteFundoA,0,0)
		endif
endfunction

function Nuvem()
	global spriteNuvem
	imagemNuvem = LoadImage("nuvens.png")
	spriteNuvem = CreateSprite(imagemNuvem)
	SetSpritePosition(spriteNuvem,0,100)
endfunction

function NuvemMoving()
	SetSpritePosition(spriteNuvem,GetSpriteX(spriteNuvem)-3,GetSpriteY(spriteNuvem))
	if(GetSpriteX(spriteNuvem) < - 1500)
		SetSpritePosition(spriteNuvem,1024,GetSpriteY(spriteNuvem))
	endif
endfunction

function GroundMoving()
	SetSpriteX(spriteDoFundoCorrendo, GetSpriteX(spriteDoFundoCorrendo) - groundSpeed)
	if(GetSpriteX(spriteDoFundoCorrendo) < -5750)
		SetSpritePosition(spriteDoFundoCorrendo,0,699)
endif
endfunction

function Menu()	
	
global menuTitleSprite
global animationControl = 1
global animationControlSB = 1
global animationControlEB = 1
global menuStartButtonSprite
global menuExitButtonSprite
global menuBackgroundSprite
global menuSong
global buttonSound


buttonSound = LoadSound("Over.wav")

menuSong = LoadSound("menuSong.wav")
PlaySound(menuSong,50)

menuBackgroundImage =LoadImage("menubackground1.png")
menuBackgroundSprite = CreateSprite(menuBackgroundImage)
menuTitleImage = LoadImage("menutitle.png")
menuTitleSprite = CreateSprite(menuTitleImage)
SetSpritePosition(menuTitleSprite,120,50)
menuStartButtonImage = LoadImage("startbutton.png")
menuStartButtonSprite = CreateSprite(menuStartButtonImage)
SetSpritePosition(menuStartButtonSprite,170,300)
menuExitButtonImage = LoadImage("exitbutton.png")
menuExitButtonSprite = CreateSprite(menuExitButtonImage)
SetSpritePosition(menuExitButtonSprite,570,300)

endfunction

function MenuOnOff(menuscreen)
	if(menuscreen = 0)
	SetSpriteVisible(menuBackgroundSprite,0)
	SetSpriteVisible(menuTitleSprite,0)
	SetSpriteVisible(menuStartButtonSprite,0)
	SetSpriteVisible(menuExitButtonSprite,0)
	else 
	TitleAnimation(menuscreen)
	StartButtonAnimation(menuscreen)
	ExitButtonAnimation(menuscreen)
	SetSpriteVisible(menuBackgroundSprite,1)
	SetSpriteVisible(menuTitleSprite,1)
	SetSpriteVisible(menuStartButtonSprite,1)
	SetSpriteVisible(menuExitButtonSprite,1)
	
	
	
	if(GetSoundsPlaying(menuSong) = 0)
		PlaySound(menuSong,10)
	endif
	endif
	
		
endfunction

function TitleAnimation(active)

if(active = 1)
	if(animationControl = 1 )
		SetSpriteSize(menuTitleSprite,GetSpriteWidth(menuTitleSprite) + 1, GetSpriteHeight(menuTitleSprite) + 1)
		if(GetSpriteWidth(menuTitleSprite) > 810)
			animationControl = 0
		endif
	else
		SetSpriteSize(menuTitleSprite,GetSpriteWidth(menuTitleSprite) - 1, GetSpriteHeight(menuTitleSprite) - 1)
		if(GetSpriteWidth(menuTitleSprite) = 764)
			animationControl = 1
		endif
	endif
endif
print(GetSpriteHeight(menuStartButtonSprite))
segundos = GetSeconds()
endfunction

function StartButtonAnimation(active)
	mousex = GetPointerX()
	mousey = GetPointerY()
	spritex = GetSpriteX(menuStartButtonSprite)
	spritey = GetSpriteY(menuStartButtonSprite)
	global pointerOverStart = 0
	if( mousex >= spritex and mousex <= spritex + GetSpriteWidth(menuStartButtonSprite) and mousey >= spritey and mousey <= spritey + GetSpriteHeight(menuStartButtonSprite))
		pointerOverStart = 1
		if(playst = 1)
			PlaySound(buttonSound,20)
			playst = 0
		endif
	endif
	if(active = 1 and pointerOverStart = 1)
		
		if(animationControlSB = 1)
			SetSpriteSize(menuStartButtonSprite,GetSpriteWidth(menuStartButtonSprite)+2,GetSpriteHeight(menuStartButtonSprite)+2)
			if(GetSpriteWidth(menuStartButtonSprite) > 250)
				animationControlSB = 0
			endif
			
		endif
		
		if(animationControlSB = 0)
			SetSpriteSize(menuStartButtonSprite,GetSpriteWidth(menuStartButtonSprite)-2,GetSpriteHeight(menuStartButtonSprite)-2)
			if(GetSpriteWidth(menuStartButtonSprite) < 230)
				animationControlSB = 1
			endif
		endif
		if(GetPointerPressed() = 1)
			startGame = 1
			menuscreen = 0
			global stop = 0
		endif
		else
			SetSpriteSize(menuStartButtonSprite,230,164)
			playst = 1
	endif
	
endfunction

function ExitButtonAnimation(active)
	
	
	
	mousex = GetPointerX()
	mousey = GetPointerY()
	spritex = GetSpriteX(menuExitButtonSprite)
	spritey = GetSpriteY(menuExitButtonSprite)
	global pointerOverExit = 0
	if( mousex >= spritex and mousex <= spritex + GetSpriteWidth(menuExitButtonSprite) and mousey >= spritey and mousey <= spritey + GetSpriteHeight(menuExitButtonSprite))
		pointerOverExit = 1
		if(playxt = 1)
			PlaySound(buttonSound,20)
			playxt = 0
		endif
	endif
	if(active = 1 and pointerOverExit = 1)
		
		if(animationControlEB = 1)
			SetSpriteSize(menuExitButtonSprite,GetSpriteWidth(menuExitButtonSprite)+2,GetSpriteHeight(menuExitButtonSprite)+2)
			if(GetSpriteWidth(menuExitButtonSprite) > 250)
				animationControlEB = 0
			endif
			
		endif
		
		if(animationControlEB = 0)
			SetSpriteSize(menuExitButtonSprite,GetSpriteWidth(menuExitButtonSprite)-2,GetSpriteHeight(menuExitButtonSprite)-2)
			if(GetSpriteWidth(menuExitButtonSprite) < 230)
				animationControlEB = 1
			endif
		endif
		if(GetPointerPressed() = 1)
			end
		endif
		else
			SetSpriteSize(menuExitButtonSprite,230,164)
			playxt = 1
	endif
	
endfunction

function Borda()
	
	if(GetSpriteX(spritePersonagemPrincipalCorrendo) < bordax1)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,bordax1,GetSpriteY(spritePersonagemPrincipalCorrendo))
		endif
	if(GetSpriteX(spritePersonagemPrincipalCorrendo) > bordax2)
		SetSpritePosition(spritePersonagemPrincipalCorrendo,bordax2,GetSpriteY(spritePersonagemPrincipalCorrendo))
	endif
	
	if(hellFinal = 1)
		if(GetSpriteY(spritePersonagemPrincipalCorrendo) > 510)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo),510)
		endif
	endif
	
endfunction

function Gaming(startGame)
	
	if(startGame = 1 and stop = 0)
		global gameSound
		global jumpSound
		global stepSound
		global bibleSound
		global cruxSound
		global cigarSound
		global beerSound
		global pantieSound
		global birdSound
		birdSound = LoadSound("birds1.wav")
		pantieSound = LoadSound("pantie.wav")
		beerSound = LoadSound("beer.wav")
		bibleSound = LoadSound("holy1.wav")
		cruxSound = LoadSound("holy2.wav")
		cigarSound = LoadSound("tosse.wav")
		
		stop = 1
		BackgroundRunning()
		PlayerRunning()
		inimigo = random(1,5)
		Fundo()
		Nuvem()
		Bird()
		Bird1()
		SmokingAnimation()
		PantieAnimation()
		BookAnimation()
		CruxAnimation()
		BeerAnimation()
		DevilFunction()
		AngelFunction()
		
		
		
		StopSound(menuSong)
		gameSound = LoadSound("chrono.wav")
		PlaySound(gameSound,20)
		jumpSound = LoadSound("jump.wav")
		stepSound = LoadSound("stepGrass4.wav")
	endif
	
	
	if(startGame = 1 and stop = 1)
		//som do pulo
		if(GetSoundsPlaying(stepSound) = 0 and GetSpriteY(spritePersonagemPrincipalCorrendo) = 635)
		PlaySound(stepSound,50)
		endif
		//funcoes de movimento
		GroundMoving()
		FundoMoving()
		NuvemMoving()
		BirdMoving(birdSprite)
		BirdMoving(birdSprite1)
		treeMoving()
		DevilAnimation()
		AngelAnimation()
		
		//som dos passaros
		BirdSound(birdSprite)
		BirdSound(birdSprite1)
		
		if(GetSoundsPlaying(gameSound) = 0)
			PlaySound(gameSound,10)
		endif
		
		if(invoca = 1)
				InvocaInimigo(inimigo)
				inimigovel = random(15,50)
		endif
		PlayerMobility()
		
		if(GetSpriteCollision(spritePersonagemPrincipalCorrendo,spriteInimigo) = 1)
			if(inimigo = 1 or inimigo = 4)
				heaven = heaven + 1
				if(inimigo = 1 and heaven < 9)
					PlaySound(bibleSound)
					inimigoAnima = 1
					animationplayed = 0
				endif
				if(inimigo = 4 and heaven < 9)
					PlaySound(cruxSound)
					inimigoAnima = 4
					animationplayed = 0
				endif
			endif
			
			if(inimigo = 2 or inimigo = 3 or inimigo = 5)
				if(inimigo = 3 and hell < 9)
					PlaySound(cigarSound,50)
					inimigoAnima = 3
					animationplayed = 0
				endif
				if(inimigo = 2 and hell <9)
					PlaySound(beerSound)
					inimigoAnima = 2
					animationplayed = 0
				endif
				if(inimigo = 5 and hell <9)
					PlaySound(pantieSound)
					inimigoAnima = 5
					animationplayed = 0
				endif
				hell = hell + 1
			endif
			SetSpriteVisible(spriteInimigo,0)
			inimigo = Random(1,5)
			invoca = 1
			
			
		endif
		
		//animation
		AnimationPosition(inimigoAnima)
		
		
		//pulo do personagem
		if(jump = 1 and GetSpriteY(spritePersonagemPrincipalCorrendo) > 451)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo), GetSpriteY(spritePersonagemPrincipalCorrendo) -25)
			if(GetSpriteY(spritePersonagemPrincipalCorrendo) <= 450)
				jump = 2
			endif
		endif
		if(jump = 2)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo), GetSpriteY(spritePersonagemPrincipalCorrendo) +25)
			if(GetSpriteY(spritePersonagemPrincipalCorrendo) = 635)
				jump = 0
			endif
		endif
		
		//Limite de borda do personagem
		Borda()
		
		// movimento do inimigo
		SetSpritePosition(spriteInimigo,GetSpriteX(spriteInimigo) - inimigovel,GetSpriteY(spriteInimigo))
		if(GetSpriteX(spriteInimigo) < -300)
			SetSpriteVisible(spriteInimigo,0)
			inimigo = random(1,5)
			invoca = 1
		endif 
		time = GetSeconds() - segundos
		printC(time)
		print("/60 segundos")
		
		
		 
	endif
	
	
endfunction

function HellHeavenFinal(hellFinal, heavenFinal)
	if(hellFinal = 1)
		demon1Movement()
		AumentaVelDemon()
		atirabola()
		movimentabola(mov)
		colisao()
		PlayerMobility()
		jump()
		Borda()
		if(20-timef > 0)
			timef = GetSeconds() - time 
		endif
		SetTextString(texthell,"sofrimento: "+str(sofrimento))
		SetTextString(texttempo,"Tempo restante: "+ str(20 - timef))
		if(20-timef <= 0)
			StopSound(hellsound)
			hellfinal = 2
			SetSpriteVisible(demon1ASprite,0)
			SetSpriteVisible(spritePersonagemPrincipalCorrendo,0)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,-10,-100)
			SetSpriteVisible(bola1,0)
			SetSpriteVisible(bola2,0)
			SetSpriteVisible(bola3,0)
			SetTextVisible(texttempo,0)
		endif
	endif
	if(hellFinal = 2)
		if(GetSoundsPlaying(hellsound1)= 0 )
			PlaySound(hellSound1,50)
			global boomsound
			global stsound = 1
			boomsound = LoadSound("boom.wav")
			
		endif
		

		jump = 0
		SetSpriteImage(spriteFinal,imagemsofrimentojose)
			StopSound(ouchsound)
			StopSound(asasDemon)
			StopSound(bolaFogo) 
			FinalHellAnimationText()
	endif
	
	if(heavenFinal = 1)
		if(stophouse = 0)
		createhouse()
		else
			if(stophouse = 1)
				createchair()
				else
					if(stophouse = 2)
						createtable()
						else
							SetTextVisible(textoexplica,0)
							playerAnimation()
					endif
			endif
	endif	
	endif
endfunction

function InvocaInimigo(inimigo)
	
	global spriteInimigo
	global imageNada 
	imageNada = LoadImage("spritenada.png")
	imageBible = LoadImage("bible.png")
	imageBeer = LoadImage("beer.png")
	imageCigar = LoadImage("cigar.png")
	imageCrux = LoadImage("crux.png")
	imagePantie = LoadImage("pantie.png")
	spriteInimigo = CreateSprite(imageNada)
	SetSpriteSize(spriteInimigo, 50,50)
	if(inimigo = 1)
		SetSpriteImage(spriteInimigo,imageBible)
	endif
	if(inimigo = 2)
		SetSpriteImage(spriteInimigo,imageBeer)
	endif
	if(inimigo = 3)
		SetSpriteImage(spriteInimigo,imageCigar)
	endif
	if(inimigo = 4)
		SetSpriteImage(spriteInimigo,imageCrux)
	endif
	if(inimigo = 5)
		SetSpriteImage(spriteInimigo,imagePantie)
	endif
	
	SetSpritePosition(spriteInimigo, random(2500,3000) , random(500,630))
	invoca = 0
	
	
endfunction

function Final(heaven,hell)
	global spriteFinal
	if(heaven = 3 and final = 0)
		//final no ceu
		StopSound(gameSound)
		heavenSound = LoadSound("heaven.wav")
		PlaySound(heavenSound,50)
		global spriteCeu
		startgame = 0
		imageCeu = LoadImage("heaven.jpg")
		spriteFinal = CreateSprite(imageCeu)
		SetSpriteSize(spriteFinal,1024,768)
		final = 1
		heavenFinal = 1
		paraiso()
		houses()
		angel()
		textoanimacaoheaven()
		global textoexplica
		textoexplica = CreateText("Clique para construir o lar de jose no ceu")
		SetTextFont(textoexplica,2)
		SetTextPosition(textoexplica,80,185)
		SetTextSize(textoexplica,30)
	endif
	if(hell = 4 and final = 0)
		//finak no inferno
		StopSound(gameSound)
		global hellSound
		hellSound = LoadSound("inferno.wav")
		PlaySound(hellSound,50)
		global hellsound1
		hellsound1 = LoadSound("inferno.wav")
		global imagemsofrimentojose
		startgame = 0
		imagemsofrimentojose = LoadImage("sofrimento_jose.png")
		imageInferno = LoadImage("hell1.png")
		spriteFinal = CreateSprite(imageInferno)
		SetSpriteSize(spriteFinal,1024,768)
		final = 1
		hellFinal = 1
		jumpheight = 510
		bordax1 = 100
		bordax2 = 880
		
		
		global texthell
		texthell = CreateText(str(sofrimento))
		SetTextSize(texthell,60.0)
		SetTextPosition(texthell,0,0)
		LoadFont(1,"Ancient Medium.ttf")
		SetTextFont(texthell,1)
		global texttempo
		
		texttempo = CreateText("")
		SetTextSize(texttempo,60.0)
		SetTextPosition(texttempo,0,50)
		SetTextFont(texttempo,1)
		
		Demon1Animation()
		CriaBola()
		sons()
		
		SetSpriteVisible(demon1ASprite,1)
		SetSpriteDepth(demon1ASprite,1)
		SetSpriteDepth(bola1,1)
		SetSpriteDepth(bola2,1)
		SetSpriteDepth(bola3,1)
		SetSpriteDepth(spritePersonagemPrincipalCorrendo,1)
		SetSpritePosition(spritePersonagemPrincipalCorrendo,500,510)
		
		
		
	endif
	
	if(time >= 60 and final = 0)
		StopSound(gameSound)
		limboFinal = LoadSound("sadness.wav")
		PlaySound(limboFinal,50)
		startgame = 0
		imageLimbo = LoadImage("limbo.jpg")
		spriteFinal = CreateSprite(imageLimbo)
		SetSpriteSize(spriteFinal,1024,768)
		final = 1
		
	endif	
	
	

endfunction

function Bird()
	global birdSprite
	birdImage = LoadImage("birds.png")
	birdSprite = CreateSprite(birdImage)
	SetSpriteAnimation(birdSprite,32,31,5)
	SetSpriteSize(birdSprite,50,50)
	SetSpritePosition(birdSprite,1000,200)
	PlaySprite(birdSprite,10)
	
endfunction

function Bird1()
	global birdSprite1
	birdImage1 = LoadImage("birds.png")
	birdSprite1 = CreateSprite(birdImage1)
	SetSpriteAnimation(birdSprite1,32,31,5)
	SetSpriteSize(birdSprite1,50,50)
	SetSpritePosition(birdSprite1,1200,150)
	PlaySprite(birdSprite1,10)
	
endfunction

function BirdMoving(nome)
	SetSpritePosition(nome,GetSpriteX(nome)-7.0,GetSpriteY(nome))
	if(GetSpriteX(nome) < -100)
		SetSpritePosition(nome,random(1000,3000),random(100,300))
		birdsoundplayed = 0
	endif
endfunction

function BirdSound(nome)
	if(GetSpriteX(nome) < 800 and GetSpriteX(nome) > 0 and GetSoundsPlaying(birdSound) = 0 and birdsoundplayed < 1)
		PlaySound(birdSound,30)
		birdsoundplayed = birdsoundplayed + 1
	endif
endfunction

function Tree()
	global treeSprite
	treeImage = LoadImage("arvores.png")
	treeSprite = CreateSprite(treeImage)
	//SetSpriteSize(treeSprite,13024,500)
	SetSpritePosition(treeSprite,0,450)
	SetSpriteColorAlpha(treeSprite,170)

endfunction

function TreeMoving()
	SetSpritePosition(treeSprite,GetSpriteX(treeSprite)-5.0,GetSpriteY(treeSprite))
	if(GetSpriteX(treeSprite) < -2540)
		SetSpritePosition(treeSprite,1024,450)
	endif
	
	
endfunction

function AnimationPosition(nome)
	
	
	if(nome = 1 and GetSoundsPlaying(bibleSound) = 1)
		AnimationPartX(bookASprite)
		AnimationPartY(bookASprite)
		else
			SetSpritePosition(bookASprite,2000,2000)
	endif
	
	if(nome = 2 and GetSoundsPlaying(beerSound) = 1)
		AnimationPartX(beerASprite)
		AnimationPartY(beerASprite)
		else
			SetSpritePosition(beerASprite,2000,2000)
	endif
	
	if(nome = 3 and GetSoundsPlaying(cigarSound) = 1)
		AnimationPartX(smokingASprite)
		AnimationPartY(smokingASprite)
		else
			SetSpritePosition(smokingASprite,2000,2000)
	endif
	
	if(nome = 4 and GetSoundsPlaying(cruxSound) = 1)
		AnimationPartX(cruxASprite)
		AnimationPartY(cruxASprite)
		else
			SetSpritePosition(cruxASprite,2000,2000)
	endif
	
	if(nome = 5 and GetSoundsPlaying(pantieSound) = 1 )
		AnimationPartX(pantieASprite)
		AnimationPartY(pantieASprite)
		else
			SetSpritePosition(pantieASprite,2000,2000)
	endif
	

	
	
endfunction

function SmokingAnimation()
	global smokingASprite
	smokingAImage = LoadImage("smoke_animation.png")
	smokingASprite = CreateSprite(smokingAImage)
	SetSpriteAnimation(smokingASprite,153,135,9)
	PlaySprite(smokingASprite,5)
	SetSpriteSize(smokingASprite,100,100)
	SetSpritePosition(smokingASprite,2000,2000)
endfunction

function PantieAnimation()
	global pantieASprite
	pantieAImage = LoadImage("pantie_animation.png")
	pantieASprite = CreateSprite(pantieAImage)
	SetSpriteAnimation(pantieASprite,80,95,10)
	PlaySprite(pantieASprite,5)
	SetSpriteSize(pantieASprite,100,100)
	SetSpritePosition(pantieASprite,200,200)
endfunction

function BookAnimation()
	global bookASprite
	bookAImage = LoadImage("book_animation.png")
	bookASprite = CreateSprite(bookAImage)
	SetSpriteAnimation(bookASprite,157,157,10)
	PlaySprite(bookASprite,5)
	SetSpriteSize(bookASprite,100,100)
	SetSpritePosition(bookASprite,200,200)
endfunction

function CruxAnimation()
	global cruxASprite
	cruxAImage = LoadImage("crux_animation.png")
	cruxASprite = CreateSprite(cruxAImage)
	SetSpriteAnimation(cruxASprite,499,499,5)
	PlaySprite(cruxASprite,5)
	SetSpriteSize(cruxASprite,100,100)
	SetSpritePosition(cruxASprite,200,200)
endfunction

function BeerAnimation()
	
	global beerASprite
	beerAImage = LoadImage("beer_animation.png")
	beerASprite = CreateSprite(beerAImage)
	SetSpriteAnimation(beerASprite,288,216,4)
	PlaySprite(beerASprite,5)
	SetSpriteSize(beerASprite,100,100)
	SetSpritePosition(beerASprite,200,200)
endfunction

function Demon1Animation()
	global demon1ASprite
	demon1AImage = LoadImage("demon1.png")
	demon1ASprite = CreateSprite(demon1AImage)
	SetSpriteAnimation(demon1ASprite,284,264,8)
	PlaySprite(demon1ASprite,10)
	SetSpriteSize(demon1ASprite,100,100)
	SetSpritePosition(demon1ASprite,200,200)
	SetSpriteVisible(demon1ASprite,0)
endfunction

function AnimationPartX(nome)
	if(GetSpriteX(nome) > GetSpriteX(spritePersonagemPrincipalCorrendo)-20  or GetSpriteX(nome) < GetSpriteX(spritePersonagemPrincipalCorrendo)-20 )
			SetSpritePosition(nome,GetSpriteX(spritePersonagemPrincipalCorrendo)-20 , GetSpriteY(nome))
		endif
endfunction

function AnimationPartY(nome)
	
	if(GetSpriteY(nome) > GetSpriteY(spritePersonagemPrincipalCorrendo) - 40 or GetSpriteY(nome) < GetSpriteY(spritePersonagemPrincipalCorrendo) - 40)
			SetSpritePosition(nome,GetSpriteX(nome), GetSpriteY(spritePersonagemPrincipalCorrendo) - 100)
		endif
endfunction

function DevilFunction()
	global devilSprite
	devilImage = LoadImage("devil_face.png")
	devilSprite = CreateSprite(devilImage)
	
	SetSpritePosition(devilSprite,-750,0)
	
	
endfunction

function DevilAnimation()
	if(hell > 0)
		SetSpritePosition(devilSprite,-700 + (70*hell),30)
		
	endif
	
endfunction

function AngelFunction()
	global angelSprite
	angelImage = LoadImage("angel_face.png")
	angelSprite = CreateSprite(angelImage)
	
	SetSpritePosition(angelSprite,-1050,0)
	
	
endfunction

function AngelAnimation()
	if(heaven > 0)
		SetSpritePosition(angelSprite,-1030 + (103*heaven),90)
		
	endif
	
endfunction

function BolaF()
	global bolafASprite
	
	bolafAImage = LoadImage("bolaf.png")
	bolafASprite = CreateSprite(bolafAImage)
	SetSpriteAnimation(bolafASprite,223,223,5)
	PlaySprite(bolafASprite,10)
	
endfunction

function demon1Movement()
	if(demonMov = 0)
		SetSpritePosition(demon1ASprite,GetSpriteX(demon1ASprite) +  demonSpeed, GetSpriteY(demon1ASprite) + demonSpeed/2)
		if(GetSpriteX(demon1ASprite) >= 430 or GetSpriteY(demon1ASprite) >= 260)
			demonMov = 1
		endif
	endif
	if(demonMov = 1)
		SetSpritePosition(demon1ASprite,GetSpriteX(demon1ASprite) + demonSpeed, GetSpriteY(demon1ASprite) -demonSpeed/2)
		if(GetSpriteX(demon1ASprite) >= 900 or GetSpriteY(demon1ASprite) <= 50)
			demonMov = 2
		endif
	endif
	if(demonMov = 2)
		SetSpritePosition(demon1ASprite,GetSpriteX(demon1ASprite) - demonSpeed, GetSpriteY(demon1ASprite) + demonSpeed/2)
		if(GetSpriteX(demon1ASprite) <= 430 or GetSpriteY(demon1ASprite) >= 260)
			demonMov = 3
		endif
	endif
	if(demonMov = 3)
		SetSpritePosition(demon1ASprite,GetSpriteX(demon1ASprite) - demonSpeed, GetSpriteY(demon1ASprite) -demonSpeed/2)
		if(GetSpriteX(demon1ASprite) <= 0 or GetSpriteY(demon1ASprite) <= 50)
			demonMov = 0
		endif
	endif
	if( GetSoundsPlaying(asasDemon) = 0 and GetSpriteCurrentFrame(demon1ASprite) = 3)
		PlaySound(asasDemon,50)
	endif
endfunction

function AumentaVelDemon()
	
		demonSpeed = 5 + GetSeconds()/5
		
	if( GetSpriteCurrentFrame(demon1ASprite) = 8)
			PlaySprite(demon1ASprite,demonSpeed)
	endif
endfunction

function CriaBola()
	global bola1 , bola2 , bola3
	bola1 = createsprite(bolafAImage)
	SetSpriteAnimation(bola1,223,223,5)
	PlaySprite(bola1,10)
	SetSpriteAngle(bola1,90.0)
	SetSpriteSize(bola1,80,80)
	
	bola2 = createsprite(bolafAImage)
	SetSpriteAnimation(bola2,223,223,5)
	PlaySprite(bola2,10)
	SetSpriteAngle(bola2,180.0)
	SetSpriteSize(bola2,80,80)
	SetSpritePosition(bola2,-1000,90)
	
	bola3 = createsprite(bolafAImage)
	SetSpriteAnimation(bola3,223,223,5)
	PlaySprite(bola3,10)
	SetSpriteSize(bola3,80,80)
	SetSpritePosition(bola3,2000,90)
	
	
endfunction

function movimentabola(mov)
	
	
	//bola1
	if(mov = 1)
		SetSpritePosition(bola1,GetSpriteX(bola1),GetSpriteY(bola1) + 3 + demonspeed)
		bola = 0
	endif
	if(GetSpriteY(bola1) >= 500)
			atirabola()
			mov = 0
			bola = 2
		endif
		
	//bola 2
	SetSpritePosition(bola2,GetSpriteX(bola2)- (3 +demonspeed),GetSpriteY(bola2))
	
	
	//bola3
	SetSpritePosition(bola3,GetSpriteX(bola3)+ 3 + demonspeed,GetSpriteY(bola3))
	
endfunction

function atirabola()
	if(GetSpriteCurrentFrame(demon1ASprite) = 3 )
		bola = bola + 1
	endif
	if(bola = 2)
		SetSpritePosition(bola1,GetSpriteX(demon1Asprite) + 50, getspritey(demon1Asprite) + 50)
		PlaySound(bolaFogo)
		mov = 1
	endif
	
	if(GetSpriteX(bola2) < -110)
		SetSpritePosition(bola2,1100,random(300,500))
		PlaySound(bolaFogo)
	endif
	
	if(GetSpriteX(bola3) > 1100)
		SetSpritePosition(bola3,-109,random(300,500))
		PlaySound(bolaFogo)
	endif
endfunction

function colisao()
	if(GetSpriteCollision(spritePersonagemPrincipalCorrendo,demon1ASprite))
		PlaySound(ouchsound)
		sofrimento = sofrimento + 10
	endif
	if(GetSpriteCollision(spritePersonagemPrincipalCorrendo,bola1))
		SetSpritePosition(bola1,-2323,0)
		PlaySound(ouchsound)
		sofrimento = sofrimento + 10
		mov = 0
	endif
	if(GetSpriteCollision(spritePersonagemPrincipalCorrendo,bola2))
		SetSpritePosition(bola2,-2323,0)
		PlaySound(ouchsound)
		sofrimento = sofrimento + 10
	endif
	if(GetSpriteCollision(spritePersonagemPrincipalCorrendo,bola3))
		SetSpritePosition(bola3,2323,0)
		PlaySound(ouchsound)
		sofrimento = sofrimento + 10
	endif
	
endfunction

function sons()
	
	global bolaFogo
	global asasDemon
	global ouchsound
	ouchsound = LoadSound("male_hurt.wav")
	bolaFogo = LoadSound("fireball.wav")
	asasDemon = LoadSound("flapping1.wav")
	
endfunction

function jump()
	if(jump = 1 and GetSpriteY(spritePersonagemPrincipalCorrendo) > 310)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo), GetSpriteY(spritePersonagemPrincipalCorrendo) -22.5)
			if(GetSpriteY(spritePersonagemPrincipalCorrendo) <= 310)
				jump = 2
			endif
		endif
		if(jump = 2)
			SetSpritePosition(spritePersonagemPrincipalCorrendo,GetSpriteX(spritePersonagemPrincipalCorrendo), GetSpriteY(spritePersonagemPrincipalCorrendo) +22.5)
			if(GetSpriteY(spritePersonagemPrincipalCorrendo) = 510)
				jump = 0
			endif
		endif
endfunction

function FinalHellAnimationText()
	if(20-timef = 0)
		if(GetPointerX() > 370 and GetPointerX() < 670 and GetPointerY() > 450 and GetPointerY() < 550 and GetSpriteExists(botaojogardnSprite) = 1)
			if(GetPointerPressed() = 1)
				end
			endif
		endif
		textoc = 0
			if(GetTextSize(texthell) < 120)
				SetTextSize(texthell, GetTextSize(texthell)+1)
			endif
			if(gettextx(texthell) < 250)
				SetTextPosition(texthell, gettextx(texthell) + 3, gettexty(texthell) )	
			endif
			if(gettexty(texthell) < 300)
				SetTextPosition(texthell, gettextx(texthell), gettexty(texthell)+3)	
				textof1 = CreateText("Voce condenou josé")
				global textof1
				SetTextFont(textof1,1)
				SetTextPosition(textof1,-800,100)
				SetTextSize(textof1,120)
			endif
			if(gettextx(texthell) >= 250 and gettexty(texthell) >= 300)
				if(GetSoundsPlaying(boomsound) = 0 and stsound > 0)
					PlaySound(boomsound)
					stsound = 0
				endif
				if(gettextx(textof1) < 180)
					SetTextPosition(textof1, gettextx(textof1) + 6, gettexty(textof1) )
				endif
				if(gettextx(textof1) > 180 and stsound =0)
					PlaySound(boomsound)
					SetTextPosition(textof1,gettextx(textof1)+0.1,gettexty(textof1))
					stsound = -1
					if(GetPointerPressed() = 1)
						end
						endif
					//BotaoJogarNovamente(370,450)
				endif
			endif
		endif
endfunction

function BotaoJogarNovamente(x,y)
	global botaojogardnSprite
	botaojogardnImage = LoadImage("botaodn.png")
	botaojogardnSprite = CreateSprite(botaojogardnImage)
	SetSpriteSize(botaojogardnSprite,300,150)
	SetSpritePosition(botaojogardnSprite,x,y)
endfunction

function paraiso()
	global paraisosprite
	paraisoimagem = LoadImage("paraiso.png")
	paraisosprite = CreateSprite(paraisoimagem)
	SetSpriteSize(paraisosprite,1024,768)
endfunction

function houses()
	global cabanasprite
	cabanaimagem = LoadImage("cabana.png")
	cabanasprite = CreateSprite(cabanaimagem)
	SetSpritePosition(cabanasprite,-150,0)
	SetSpriteSize(cabanasprite,100,100)
	
	
	global cadeirasprite
	cadeiraimagem = LoadImage("cadeirap.png")
	cadeirasprite = CreateSprite(cadeiraimagem)
	SetSpritePosition(cadeirasprite,-150,0)
	SetSpriteSize(cadeirasprite,80,80)
	
	global mesasprite
	mesaimagem = LoadImage("mesa.png")
	mesasprite = CreateSprite(mesaimagem)
	SetSpritePosition(mesasprite,-150,0)
	SetSpriteSize(mesasprite,80,80)
	SetSpriteDepth(mesasprite,1)
	
	global homemsprite
	homemimagem = LoadImage("homem_sentado.png")
	homemsprite = CreateSprite(homemimagem)
	SetSpritePosition(homemsprite,-150,0)
	SetSpriteSize(homemsprite,160,80)
	
	global textoheaven
	textoheaven = CreateText("Voce Salvou Jose")
	LoadFont(2,"Daydream.ttf")
	SetTextFont(textoheaven,2)
	SetTextSize(textoheaven,80)
	SetTextPosition(textoheaven,80,-200)
	
	global smoke1sprite
	smoke1imagem = LoadImage("smoke1.png")
	smoke1sprite = CreateSprite(smoke1imagem)
	SetSpriteAnimation(smoke1sprite,250,250,4)
	SetSpriteSize(smoke1sprite,50,50)
	SetSpritePosition(smoke1sprite,-50,-50)
	PlaySprite(smoke1sprite,5)
	
	
endfunction

function createhouse()
	
		if(GetPointerX() > 0 and GetPointerX() < 350 and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cabanasprite,0,255,0,150)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cabanasprite,255,255,255,255)
						SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 1
						
					endif
				endif
		endif
	
		if(GetPointerX() > 350 and GetPointerX() < 480 and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 460)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cabanasprite,0,255,0,150)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cabanasprite,255,255,255,255)
						SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 1
						
					endif
				endif
		endif
	
		if(GetPointerX() > 480 and GetPointerX() < 630 and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 540)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cabanasprite,0,255,0,150)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cabanasprite,255,255,255,255)
						SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 1
						
					endif
				endif
		endif
	
		if(GetPointerX() > 630 and GetPointerX() < 700  and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 560)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cabanasprite,0,255,0,150)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cabanasprite,255,255,255,255)
						SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 1
						
					endif
				endif
		endif
	
		if(GetPointerX() > 700 and GetPointerX() < 900 and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 496)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cabanasprite,0,255,0,150)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cabanasprite,255,255,255,255)
						SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 1
						
					endif
				endif
		endif
	
		if(GetPointerX() > 900 and GetPointerX() < 1024  and stophouse = 0)
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(cabanasprite,255,0,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				else
				SetSpriteColor(cabanasprite,0,255,0,150)
				SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY() -50)
				if(GetPointerPressed())
					SetSpriteColor(cabanasprite,255,255,255,255)
					SetSpritePosition(cabanasprite,GetPointerX()-50,GetPointerY()-50)
					stophouse = 1
					
				endif
			endif
		endif
	

	
endfunction

function createchair()
		if(GetPointerX() > 0 and GetPointerX() < 350 )
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cadeirasprite,0,255,0,150)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cadeirasprite,255,255,255,255)
						SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 2
					endif
				endif
		endif
	
		if(GetPointerX() > 350 and GetPointerX() < 480 )
			if( GetPointerY() > 0 and GetPointerY() < 460)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cadeirasprite,0,255,0,150)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cadeirasprite,255,255,255,255)
						SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 2
					endif
				endif
		endif
	
		if(GetPointerX() > 480 and GetPointerX() < 630 )
			if( GetPointerY() > 0 and GetPointerY() < 540)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cadeirasprite,0,255,0,150)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cadeirasprite,255,255,255,255)
						SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 2
					endif
				endif
		endif
	
		if(GetPointerX() > 630 and GetPointerX() < 700 )
			if( GetPointerY() > 0 and GetPointerY() < 560)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cadeirasprite,0,255,0,150)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cadeirasprite,255,255,255,255)
						SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 2
					endif
				endif
		endif
	
		if(GetPointerX() > 700 and GetPointerX() < 900 )
			if( GetPointerY() > 0 and GetPointerY() < 496)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(cadeirasprite,0,255,0,150)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(cadeirasprite,255,255,255,255)
						SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 2
					endif
				endif
		endif
	
		if(GetPointerX() > 900 and GetPointerX() < 1024 )
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(cadeirasprite,255,0,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				else
				SetSpriteColor(cadeirasprite,0,255,0,150)
				SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY() -50)
				if(GetPointerPressed())
					SetSpriteColor(cadeirasprite,255,255,255,255)
					SetSpritePosition(cadeirasprite,GetPointerX()-50,GetPointerY()-50)
					stophouse = 2
				endif
			endif
		endif
	
	
	
endfunction

function createtable()
		if(GetPointerX() > 0 and GetPointerX() < 350 )
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(mesasprite,0,255,0,150)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(mesasprite,255,255,255,255)
						SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 3
					endif
				endif
		endif
	
		if(GetPointerX() > 350 and GetPointerX() < 480 )
			if( GetPointerY() > 0 and GetPointerY() < 460)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(mesasprite,0,255,0,150)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(mesasprite,255,255,255,255)
						SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 3
					endif
				endif
		endif
	
		if(GetPointerX() > 480 and GetPointerX() < 630 )
			if( GetPointerY() > 0 and GetPointerY() < 540)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(mesasprite,0,255,0,150)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(mesasprite,255,255,255,255)
						SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 3
					endif
				endif
		endif
	
		if(GetPointerX() > 630 and GetPointerX() < 700 )
			if( GetPointerY() > 0 and GetPointerY() < 560)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(mesasprite,0,255,0,150)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(mesasprite,255,255,255,255)
						SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 3
					endif
				endif
		endif
	
		if(GetPointerX() > 700 and GetPointerX() < 900 )
			if( GetPointerY() > 0 and GetPointerY() < 496)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
					SetSpriteColor(mesasprite,0,255,0,150)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
					if(GetPointerPressed())
						SetSpriteColor(mesasprite,255,255,255,255)
						SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
						stophouse = 3
					endif
				endif
		endif
	
		if(GetPointerX() > 900 and GetPointerX() < 1024 )
			if( GetPointerY() > 0 and GetPointerY() < 600)
				SetSpriteColor(mesasprite,255,0,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				else
				SetSpriteColor(mesasprite,0,255,0,150)
				SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY() -50)
				if(GetPointerPressed())
					SetSpriteColor(mesasprite,255,255,255,255)
					SetSpritePosition(mesasprite,GetPointerX()-50,GetPointerY()-50)
					stophouse = 3
				endif
			endif
		endif
	
	
	
endfunction

function angel()
	global angelsprite1
	angelimage = LoadImage("anjo.png")
	angelsprite1 = CreateSprite(angelimage)
	SetSpriteSize(angelsprite1,160,80)
	SetSpriteAnimation(angelsprite1,228,109,5)
	PlaySprite(angelsprite1,10)
	SetSpritePosition(angelsprite1,-10,800)
endfunction

function playerAnimation()
	
	if(GetSpriteX(angelsprite1) > GetSpriteX(cadeirasprite) -50)
		SetSpritePosition(angelsprite1,GetSpriteX(angelsprite1) - 5, GetSpriteY(angelsprite1))
		
	endif
	if(GetSpriteX(angelsprite1) < GetSpriteX(cadeirasprite) -50)
		SetSpritePosition(angelsprite1,GetSpriteX(angelsprite1) + 5, GetSpriteY(angelsprite1))
		
	endif
	if(GetSpriteY(angelsprite1) > GetSpriteY(cadeirasprite)-50)
		SetSpritePosition(angelsprite1,GetSpriteX(angelsprite1) , GetSpriteY(angelsprite1) - 3)
		
	endif
	if(GetSpriteY(angelsprite1) < GetSpriteY(cadeirasprite)-50)
		SetSpritePosition(angelsprite1,GetSpriteX(angelsprite1) , GetSpriteY(angelsprite1) + 3)
		
	endif
	if(GetSpriteY(angelsprite1) >= GetSpriteY(cadeirasprite) -50 and GetSpriteY(angelsprite1) <= GetSpriteY(cadeirasprite) -40)
		if(GetSpriteX(angelsprite1) >= GetSpriteX(cadeirasprite) -50 and GetSpriteX(angelsprite1) <= GetSpriteX(cadeirasprite) -40)
			SetSpriteVisible(angelsprite1,0)
			SetSpritePosition(homemsprite,GetSpriteX(angelsprite1), GetSpriteY(angelsprite1) + 30)
			textoanimacaoheaven()
		endif
	endif
	
endfunction

function textoanimacaoheaven()
	if(gettexty(textoheaven) <200)
		SetTextPosition(textoheaven,gettextx(textoheaven),gettexty(textoheaven)+3)
		else
			SetSpritePosition(smoke1sprite,GetSpriteX(cabanasprite)+ 10,GetSpriteY(cabanasprite) -40)
	endif
endfunction
