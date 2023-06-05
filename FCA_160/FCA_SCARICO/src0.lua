ResetElapsedTime()
DO(3,1)
DO(4,0)
DO(5,0)
DO(2,0)
Sync()
while not ((DI(16) == ON)) do
  Sleep(1)
end
DO(1,1)
Sleep(2 * 1000)
  CONTA_PEZZO = 0
  time = 0
  min = 0
  Dimensione_cassone = 616
  secxpezzo = 0
  controllo = 0
  secxpezzo = 0
  x = 0
  y = 0
  z = 0
  sec = 0
  Go((P4), "CP=80")
  ToolDO(1,0)

DO(1,0)
DO(2,1)
Go((P3), "CP=95")
Go((P2), "CP=95")
Sync()
while not ((DI(2) == ON)) do
  Sleep(1)
end
Sync()
if DI(2) == ON then
  CONTA_PEZZO = CONTA_PEZZO + 1
  Sync()
  print('CONTA PEZZO:')
  Sync()
  print(CONTA_PEZZO)
end
Move((P1), "SpeedS=50")
ToolDO(1,1)
Move((P2), "CP=95")
Sync()
if DI(1) == ON then
  Sync()
  while not ((DI(16) == ON)) do
    Sleep(1)
  end
  Sync()
  if ToolDI(1) == OFF then
    Sync()
    print('Air pressure is not enough!')
    DO(3,0)
    DO(4,1)
    DO(5,1)
    Sync()
    Pause()
  end
  DO(5,0)
  DO(4,0)
  DO(3,1)

  Sync()
  if CONTA_PEZZO<Dimensione_cassone then
    Sync()
    while not (DI(16) == OFF) do
      DO(2,0)
      DO(1,1)
    end
  end
end
  Sync()
  if DI(10) == ON then
    DO(1,0)
    DO(2,1)
    Go((P3), "CP=90")
    Sync()
    if ToolDI(1) == OFF then
      DO(3,0)
      DO(4,0)
      DO(5,1)
      Sync()
      Pause()
    end
    DO(5,0)
    DO(4,0)
    DO(3,1)

    Go(RP((P10),{(0-(controllo*delta_controllo)),0,0}))
    Move(RP((P9),{(0-(controllo*delta_controllo)),0,0}))
    ToolDO(1,0)
    Move(RP((P10),{(0-(controllo*delta_controllo)),0,0}))
    Sync()
    if controllo<2 then
      controllo = controllo + 1
    else
      controllo = 0
    end
    MoveJ((P3), "CP=95")
    Go((P2), "CP=95")
    Sync()
    while not ((DI(2) == ON)) do
      Sleep(1)
    end
    CONTA_PEZZO = CONTA_PEZZO + 1
    Sync()
    print('CONTA PEZZO:')
    Sync()
    print(CONTA_PEZZO)
    Move((P1), "SpeedS=50")
    ToolDO(1,1)
    Move((P2), "CP=95")
    Sync()
    if ToolDI(1) == OFF then
      DO(3,0)
      DO(4,0)
      DO(5,1)
      Sync()
      Pause()
    end
    Sync()
    if (ToolDI(1) == ON) and (not ((x==2) and ((y==7) and (z==24)))) then
      Sync()
      while not ((DI(16) == ON)) do
        Sleep(1)
      end
      Sync()
      while not (DI(16) == OFF) do
        DO(2,0)
        DO(1,1)
      end
      Sync()
      if (ToolDI(1) == ON) and (not ((x==2) and ((y==7) and (z==24)))) then
        DO(2,0)
        DO(1,1)
      end
    end
  end

DO(1,0)
DO(2,1)
Go((P3), "CP=95")
Go((P4), "CP=95")
Sync()
for count3 = 1, math.floor(z_dim_sc) do
  y = 0
  Sync()
  for count2 = 1, math.floor(y_dim_sc) do
    x = 0
    Sync()
    for count = 1, math.floor(x_dim_sc) do
      Sync()
      if DI(1) == ON then
          Sync()
          if ToolDI(1) == OFF then
            DO(3,0)
            DO(4,0)
            DO(5,1)
            Sync()
            Pause()
          end
          DO(5,0)
          DO(4,0)
          DO(3,1)
          Go(RP((P7),{(x*delta_x_sc),(0+(y*delta_y_sc)),0}))
          Move(RP((P5),{(x*delta_x_sc),(0+(y*delta_y_sc)),(0-(z*altezza_pezzo))}))
          ToolDO(1,0)
          Move(RP((P7),{(x*delta_x_sc),(0+(y*delta_y_sc)),0}))

        Go((P4), "CP=95")
        Sync()
        if CONTA_PEZZO==Dimensione_cassone then
          goto label1
        end
        DO(1,0)
        DO(2,1)
        Go((P3), "CP=95")
        Go((P2), "CP=95")
        Sync()
        while not ((DI(2) == ON)) do
          Sleep(1)
        end
        Sync()
        if DI(2) == ON then
          CONTA_PEZZO = CONTA_PEZZO + 1
          Sync()
          print('CONTA PEZZO:')
          Sync()
          print(CONTA_PEZZO)
        end
        Move((P1), "SpeedS=50")
        ToolDO(1,1)
        Move((P2), "CP=95")
        Sync()
        if DI(1) == ON then
          Sync()
          while not ((DI(16) == ON)) do
            Sleep(1)
          end
          Sync()
          if ToolDI(1) == OFF then
            Sync()
            print('Air pressure is not enough!')
            DO(3,0)
            DO(4,1)
            DO(5,1)
            Sync()
            Pause()
          end
          DO(5,0)
          DO(4,0)
          DO(3,1)

          Sync()
          if CONTA_PEZZO<Dimensione_cassone then
            Sync()
            while not (DI(16) == OFF) do
              DO(2,0)
              DO(1,1)
            end
          end
        end
          Sync()
          if DI(10) == ON then
            DO(1,0)
            DO(2,1)
            Go((P3), "CP=90")
            Sync()
            if ToolDI(1) == OFF then
              DO(3,0)
              DO(4,0)
              DO(5,1)
              Sync()
              Pause()
            end
            DO(5,0)
            DO(4,0)
            DO(3,1)

            Go(RP((P10),{(0-(controllo*delta_controllo)),0,0}))
            Move(RP((P9),{(0-(controllo*delta_controllo)),0,0}))
            ToolDO(1,0)
            Move(RP((P10),{(0-(controllo*delta_controllo)),0,0}))
            Sync()
            if controllo<2 then
              controllo = controllo + 1
            else
              controllo = 0
            end
            MoveJ((P3), "CP=95")
            Go((P2), "CP=95")
            Sync()
            while not ((DI(2) == ON)) do
              Sleep(1)
            end
            CONTA_PEZZO = CONTA_PEZZO + 1
            Sync()
            print('CONTA PEZZO:')
            Sync()
            print(CONTA_PEZZO)
            Move((P1), "SpeedS=50")
            ToolDO(1,1)
            Move((P2), "CP=95")
            Sync()
            if ToolDI(1) == OFF then
              DO(3,0)
              DO(4,0)
              DO(5,1)
              Sync()
              Pause()
            end
            Sync()
            if (ToolDI(1) == ON) and (not ((x==2) and ((y==7) and (z==24)))) then
              Sync()
              while not ((DI(16) == ON)) do
                Sleep(1)
              end
              Sync()
              while not (DI(16) == OFF) do
                DO(2,0)
                DO(1,1)
              end
              Sync()
              if (ToolDI(1) == ON) and (not ((x==2) and ((y==7) and (z==24)))) then
                DO(2,0)
                DO(1,1)
              end
            end
          end

        DO(1,0)
        DO(2,1)
        Go((P3), "CP=95")
        Go((P4), "CP=95")
        Sync()
        if DI(1) == OFF then
          DO(3,0)
          DO(4,0)
          DO(5,1)
          Sync()
          Pause()
        end
        DO(5,0)
        DO(4,0)
        DO(3,1)
      end
      x = x + 1
    end
    y = y + 1
  end
  z = z + 1
end
:: label1 ::
DO(3,0)
DO(4,1)
DO(5,0)
time = ElapsedTime()
min =math.floor(time / (60 *1000))
print('Minuti ciclo: ')
print(min)
sec= min*60
secxpezzo=(sec / 616)
print('Tempo per pezzo: ' )
print(secxpezzo)
