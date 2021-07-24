Lightspeed = require("lightspeed")

Lightspeed.setup({
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = true,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5,
    full_inclusive_prefix_key = "<c-x>",
    labels = nil,
    cycle_group_fwd_key = nil,
    cycle_group_bwd_key = nil,
})

--NOTE: these are incredibly confusing and may need cleaning
sethighlight("LightspeedLabel", {fg=colors.cyan, style="bold"})
sethighlight("LightspeedLabelOverlapped", {fg=colors.foreground})
sethighlight("LightspeedLabelDistant", {fg=colors.yellow, style="bold"})
sethighlight("LightspeedLabelDistantOverlapped", {fg=colors.yellow})
sethighlight("LightspeedShortcut", {fg=colors.orange, bg="NONE"})
sethighlight("LightspeedShortcutOverlapped", {fg=colors.comment})
sethighlight("LightspeedUnlabeledMatch", {fg=colors.yellow, style="bold"})
sethighlight("LightspeedMaskedChar", {fg=colors.green, style="bold"})
sethighlight("LightspeedGreyWash", {fg=colors.subtle})
sethighlight("LightspeedOneCharMatch", {bg=colors.comment})
sethighlight("LightspeedPendingOpArea", {bg=colors.pink})
sethighlight("LightspeedPendingChangeOpArea", {fg=colors.pink, bg="NONE", style="strikethrough"})
