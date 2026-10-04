local scheme = require("scheme.current")

return {
    -- Terminal: volviendo a kitty (con tu config antigua ya copiada a ~/.config/kitty)
    terminal      = "foot",
    browser       = "helium-browser",
    fileExplorer  = "nautilus",

    -- Keybinds ajustados a tus habitos de tu config anterior
    -- (antes: SUPER+Q abria terminal, SUPER+W cerraba ventana)
    kbTerminal    = "SUPER + Q",
    kbCloseWindow = "SUPER + W",
    kbBrowser     = "SUPER + B", -- liberamos SUPER+W, asi que el navegador se movio aqui

    -- SUPER+M = "maximizar" (ocupa todo el workspace pero respeta la barra/UI),
    -- SUPER+F sigue siendo pantalla completa real (oculta todo). Liberamos el workspace de musica.
    kbWindowBorderedFullscreen = { "SUPER + ALT + F", "SUPER + M" },
    kbMusicWs     = "",
    kbCommunicationWs = "", -- ya no hay apps en la capa de comunicacion (WhatsApp y Spotify ahora abren normal)
    -- SUPER+R queda libre (antes abria un script de wallpaper aleatorio que ya no existe en Caelestia)
    kbTodoWs      = "",

    -- Blur / transparencia mas marcados, parecido a tu config anterior
    blurSize      = 3,
    blurPasses    = 3,
    blurXray      = true,
    windowRounding = 5,
    windowOpacityUnfocused = 0.85, -- ventanas sin foco mas transparentes, como en tu config vieja

    -- Bordes: el default trae el borde inactivo casi invisible (11 = ~7% opacidad).
    -- Lo subimos para que se vea siempre, no solo en la ventana activa.
    windowBorderSize            = 2,
    activeWindowBorderColour    = "rgba(" .. scheme.primary .. "ee)",
    inactiveWindowBorderColour  = "rgba(" .. scheme.outline .. "aa)",
}
