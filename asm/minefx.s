	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Map effect happening when a mine is being set

	THUMB_FUNC_START sub_80222E0
sub_80222E0: @ 0x080222E0
	push {lr}
	ldr r0, _080222F8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080222F4
	ldr r0, _080222FC  @ 0x000002F9
	bl m4aSongNumStart
_080222F4:
	pop {r0}
	bx r0
	.align 2, 0
_080222F8: .4byte gPlaySt
_080222FC: .4byte 0x000002F9

	THUMB_FUNC_END sub_80222E0

	THUMB_FUNC_START BeginMineMapAnim
BeginMineMapAnim: @ 0x08022300
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r5, #4
	ldr r2, _08022364  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	adds r5, #8
	lsls r0, r6, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r0, #4
	adds r0, r4, #0
	movs r1, #0x20
	bl StartBlockingTimer
	ldr r0, _08022368  @ gUnknown_085A7CC0
	ldr r1, _0802236C  @ 0x06013000
	bl Decompress
	ldr r0, _08022370  @ gUnknown_085A7EC8
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08022374  @ gUnknown_085A7E34
	movs r3, #0xa3
	lsls r3, r3, #7
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartAnimProc
	ldr r0, _08022378  @ gUnknown_0859B560
	adds r1, r4, #0
	bl SpawnProc
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022364: .4byte gBmSt
_08022368: .4byte gUnknown_085A7CC0
_0802236C: .4byte 0x06013000
_08022370: .4byte gUnknown_085A7EC8
_08022374: .4byte gUnknown_085A7E34
_08022378: .4byte gUnknown_0859B560

	THUMB_FUNC_END BeginMineMapAnim

.align 2, 0
