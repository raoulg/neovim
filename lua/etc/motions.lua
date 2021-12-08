Lightspeed = require("lightspeed")

Lightspeed.setup({
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = true,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5,
    --x_mode_prefix_key = "<c-x>",
    labels = nil,
    cycle_group_fwd_key = nil,
    cycle_group_bwd_key = nil,
})

sethighlight("LightspeedLabel", {fg=colors.cyan, style="bold,underline"})
sethighlight("LightspeedLabelOverlapped", {fg=colors.foreground, style="underline"})
sethighlight("LightspeedLabelDistant", {fg=colors.yellow, style="bold,underline"})
sethighlight("LightspeedLabelDistantOverlapped", {fg=colors.orange, style="underline"})
sethighlight("LightspeedShortcut", {fg=colors.orange, bg="NONE", style="underline"})
sethighlight("LightspeedShortcutOverlapped", {fg=colors.comment, style="underline"})
sethighlight("LightspeedUnlabeledMatch", {fg=colors.purple, style="bold,underline"})
sethighlight("LightspeedMaskedChar", {fg=colors.green, style="bold,underline"})
sethighlight("LightspeedGreyWash", {fg=colors.subtle})
sethighlight("LightspeedOneCharMatch", {bg=colors.comment, style="underline"})
sethighlight("LightspeedPendingOpArea", {bg=colors.pink, style="underline"})
sethighlight("LightspeedPendingChangeOpArea", {fg=colors.pink, bg="NONE", style="strikethrough"})
