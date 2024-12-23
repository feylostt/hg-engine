.include "asm/include/battle_commands.inc"

.data

_000:
    PlayMoveAnimation BATTLER_CATEGORY_ATTACKER
    Wait 
    CompareMonDataToValue OPCODE_FLAG_NOT, BATTLER_CATEGORY_ATTACKER, BMON_DATA_MOVE_EFFECT, MOVE_EFFECT_FLAG_SEMI_INVULNERABLE, _011
    ToggleVanish BATTLER_CATEGORY_ATTACKER, TRUE

_011:
    PrintBufferedMessage 
    Wait 
    WaitButtonABTime 30
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_BATTLER_STAT_CHANGE, BSCRIPT_VAR_BATTLER_ATTACKER
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_PARAM, MOVE_SUBSCRIPT_PTR_SP_ATTACK_UP_1_STAGE
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_INDIRECT
    Call BATTLE_SUBSCRIPT_UPDATE_STAT_STAGE
    UpdateVar OPCODE_FLAG_OFF, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_MOVE_ANIMATIONS_OFF
    End 
