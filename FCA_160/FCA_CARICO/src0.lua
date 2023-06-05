DO(2,0)
DO(3,0)
DO(1,1)
  x = 0
  y = 0
  z = 0
  Go((P3), "Speed=50  Accel=30  CP=100")
  ToolDO(1,0)

Sync()
if DI(1) == ON then
  DO(1,1)
end
Sync()
for count3 = 1, math.floor(y_dim) do
  x = 0
  Sync()
  for count2 = 1, math.floor(x_dim) do
    z = 0
    Sync()
    for count = 1, math.floor(z_dim) do
      Sync()
      if DI(1) == ON then
          Go(RP((P2),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),0}))
          Move(RP((P1),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),(0+(z*altezza_pezzo))}))
          ToolDO(1,1)
          Sync()
          while not ((ToolDI(1) == ON)) do
            Sleep(1)
          end
          Move(RP((P2),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),0}))
          Sync()
          if ToolDI(1) == OFF then
            Go(RP((P2),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),0}))
            Move(RP((P1),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),(0+(z*altezza_pezzo))}))
            ToolDO(1,1)
            Sync()
            while not ((ToolDI(1) == ON)) do
              Sleep(1)
            end
            Move(RP((P2),{(x*delta_x),(0+((y*delta_y)+(x*y_correction))),0}))
          end

        Go((P3), "CP=100")
        MoveJ((P8), "CP=100")
        Sync()
        if ToolDI(1) == OFF then
          DO(1,0)
          DO(2,0)
          DO(3,1)
          Sync()
          print('Mancanza vuoto')
          Sync()
          Pause()
          DO(3,0)
          DO(2,0)
          DO(1,1)

        end
        ToolDO(1,0)
        MoveJ((P10), "CP=90")
        MoveJ((P11), "CP=90")
        ToolDO(1,1)
        print((ToolAI(1)))
        Sync()
        print('Prima di wait until')
        Sync()
        while not ((ToolDI(1) == ON)) do
          Sleep(1)
        end
        Sync()
        print('Pezzo preso (dopo wait until)')
        Sync()
        print((ToolAI(1)))
        Move((P12), "CP=90")
        Go((P6), "CP=90")
        Sync()
        if ToolDI(1) == OFF then
          DO(1,0)
          DO(2,0)
          DO(3,1)
          Sync()
          print('Mancanza vuoto')
          Sync()
          Pause()
          DO(3,0)
          DO(2,0)
          DO(1,1)

        end
        Sync()
        while not ((DI(2) == OFF)) do
          Sleep(1)
        end
        Move((P5), "CP=90")
        Move((P4), "CP=90")
        ToolDO(1,0)
        Move((P3), "CP=90")
        z = z + 1
        Sync()
        if DI(1) == OFF then
          DO(1,0)
          DO(2,0)
          DO(3,1)
          Sync()
          Pause()
        end
        DO(3,0)
        DO(2,0)
        DO(1,1)
      end
    end
    x = x + 1
  end
  y = y + 1
end
Go((P3), "Speed=50  Accel=30  CP=100")
ToolDO(1,0)
DO(1,0)
DO(3,0)
DO(2,1)
