1# Configurações do monitor
monitor=,preferred,auto,1

# Define a tecla principal (Mod Key) como a tecla SUPER (Windows)
$mainMod = SUPER

# Executa programas ao iniciar o Hyprland
exec-once = kitty # Inicializa o terminal ao iniciar o Hyprland
exec-once = wofi --show drun
exec-once = hyprctl setcursor '' # Define o cursor padrão, evitando o bug de cursor.

# Vincula as teclas de atalho
# Inicia um terminal
bind = $mainMod, RETURN, exec, kitty

# Inicia o lançador de aplicativos (wofi)
bind = $mainMod, SPACE, exec, wofi --show drun

# Mata a janela ativa
bind = $mainMod, Q, killactive, 

# Move o foco para outra janela
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move a janela ativa
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Gerenciamento de workspaces
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move janela para outro workspace
bind = $mainMod CTRL, 1, movetoworkspace, 1
bind = $mainMod CTRL, 2, movetoworkspace, 2
bind = $mainMod CTRL, 3, movetoworkspace, 3
bind = $mainMod CTRL, 4, movetoworkspace, 4
bind = $mainMod CTRL, 5, movetoworkspace, 5
bind = $mainMod CTRL, 6, movetoworkspace, 6
bind = $mainMod CTRL, 7, movetoworkspace, 7
bind = $mainMod CTRL, 8, movetoworkspace, 8
bind = $mainMod CTRL, 9, movetoworkspace, 9
bind = $mainMod CTRL, 0, movetoworkspace, 10

# Sai do Hyprland
bind = $mainMod SHIFT, E, exit, 
