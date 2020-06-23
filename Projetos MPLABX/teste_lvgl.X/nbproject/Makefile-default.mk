#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=lvgl/porting/lv_port_disp_template.c lvgl/porting/lv_port_fs_template.c lvgl/porting/lv_port_indev_template.c lvgl/src/lv_core/lv_debug.c lvgl/src/lv_core/lv_disp.c lvgl/src/lv_core/lv_group.c lvgl/src/lv_core/lv_indev.c lvgl/src/lv_core/lv_obj.c lvgl/src/lv_core/lv_refr.c lvgl/src/lv_core/lv_style.c lvgl/src/lv_draw/lv_draw.c lvgl/src/lv_draw/lv_draw_arc.c lvgl/src/lv_draw/lv_draw_basic.c lvgl/src/lv_draw/lv_draw_img.c lvgl/src/lv_draw/lv_draw_label.c lvgl/src/lv_draw/lv_draw_line.c lvgl/src/lv_draw/lv_draw_rect.c lvgl/src/lv_draw/lv_draw_triangle.c lvgl/src/lv_draw/lv_img_cache.c lvgl/src/lv_draw/lv_img_decoder.c lvgl/src/lv_font/lv_font.c lvgl/src/lv_font/lv_font_fmt_txt.c lvgl/src/lv_font/lv_font_roboto_12.c lvgl/src/lv_font/lv_font_roboto_12_subpx.c lvgl/src/lv_font/lv_font_roboto_16.c lvgl/src/lv_font/lv_font_roboto_22.c lvgl/src/lv_font/lv_font_roboto_28.c lvgl/src/lv_font/lv_font_roboto_28_compressed.c lvgl/src/lv_font/lv_font_unscii_8.c lvgl/src/lv_hal/lv_hal_disp.c lvgl/src/lv_hal/lv_hal_indev.c lvgl/src/lv_hal/lv_hal_tick.c lvgl/src/lv_misc/lv_anim.c lvgl/src/lv_misc/lv_area.c lvgl/src/lv_misc/lv_async.c lvgl/src/lv_misc/lv_bidi.c lvgl/src/lv_misc/lv_circ.c lvgl/src/lv_misc/lv_color.c lvgl/src/lv_misc/lv_fs.c lvgl/src/lv_misc/lv_gc.c lvgl/src/lv_misc/lv_ll.c lvgl/src/lv_misc/lv_log.c lvgl/src/lv_misc/lv_math.c lvgl/src/lv_misc/lv_mem.c lvgl/src/lv_misc/lv_printf.c lvgl/src/lv_misc/lv_task.c lvgl/src/lv_misc/lv_templ.c lvgl/src/lv_misc/lv_txt.c lvgl/src/lv_misc/lv_utils.c lvgl/src/lv_objx/lv_arc.c lvgl/src/lv_objx/lv_bar.c lvgl/src/lv_objx/lv_btn.c lvgl/src/lv_objx/lv_btnm.c lvgl/src/lv_objx/lv_calendar.c lvgl/src/lv_objx/lv_canvas.c lvgl/src/lv_objx/lv_cb.c lvgl/src/lv_objx/lv_chart.c lvgl/src/lv_objx/lv_cont.c lvgl/src/lv_objx/lv_cpicker.c lvgl/src/lv_objx/lv_ddlist.c lvgl/src/lv_objx/lv_gauge.c lvgl/src/lv_objx/lv_img.c lvgl/src/lv_objx/lv_imgbtn.c lvgl/src/lv_objx/lv_kb.c lvgl/src/lv_objx/lv_label.c lvgl/src/lv_objx/lv_led.c lvgl/src/lv_objx/lv_line.c lvgl/src/lv_objx/lv_list.c lvgl/src/lv_objx/lv_lmeter.c lvgl/src/lv_objx/lv_mbox.c lvgl/src/lv_objx/lv_objx_templ.c lvgl/src/lv_objx/lv_page.c lvgl/src/lv_objx/lv_preload.c lvgl/src/lv_objx/lv_roller.c lvgl/src/lv_objx/lv_slider.c lvgl/src/lv_objx/lv_spinbox.c lvgl/src/lv_objx/lv_sw.c lvgl/src/lv_objx/lv_ta.c lvgl/src/lv_objx/lv_table.c lvgl/src/lv_objx/lv_tabview.c lvgl/src/lv_objx/lv_tileview.c lvgl/src/lv_objx/lv_win.c lvgl/src/lv_themes/lv_theme.c lvgl/src/lv_themes/lv_theme_alien.c lvgl/src/lv_themes/lv_theme_default.c lvgl/src/lv_themes/lv_theme_material.c lvgl/src/lv_themes/lv_theme_mono.c lvgl/src/lv_themes/lv_theme_nemo.c lvgl/src/lv_themes/lv_theme_night.c lvgl/src/lv_themes/lv_theme_templ.c lvgl/src/lv_themes/lv_theme_zen.c main.c RA8875.c delay.c uart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o ${OBJECTDIR}/main.o ${OBJECTDIR}/RA8875.o ${OBJECTDIR}/delay.o ${OBJECTDIR}/uart.o
POSSIBLE_DEPFILES=${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/RA8875.o.d ${OBJECTDIR}/delay.o.d ${OBJECTDIR}/uart.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o ${OBJECTDIR}/main.o ${OBJECTDIR}/RA8875.o ${OBJECTDIR}/delay.o ${OBJECTDIR}/uart.o

# Source Files
SOURCEFILES=lvgl/porting/lv_port_disp_template.c lvgl/porting/lv_port_fs_template.c lvgl/porting/lv_port_indev_template.c lvgl/src/lv_core/lv_debug.c lvgl/src/lv_core/lv_disp.c lvgl/src/lv_core/lv_group.c lvgl/src/lv_core/lv_indev.c lvgl/src/lv_core/lv_obj.c lvgl/src/lv_core/lv_refr.c lvgl/src/lv_core/lv_style.c lvgl/src/lv_draw/lv_draw.c lvgl/src/lv_draw/lv_draw_arc.c lvgl/src/lv_draw/lv_draw_basic.c lvgl/src/lv_draw/lv_draw_img.c lvgl/src/lv_draw/lv_draw_label.c lvgl/src/lv_draw/lv_draw_line.c lvgl/src/lv_draw/lv_draw_rect.c lvgl/src/lv_draw/lv_draw_triangle.c lvgl/src/lv_draw/lv_img_cache.c lvgl/src/lv_draw/lv_img_decoder.c lvgl/src/lv_font/lv_font.c lvgl/src/lv_font/lv_font_fmt_txt.c lvgl/src/lv_font/lv_font_roboto_12.c lvgl/src/lv_font/lv_font_roboto_12_subpx.c lvgl/src/lv_font/lv_font_roboto_16.c lvgl/src/lv_font/lv_font_roboto_22.c lvgl/src/lv_font/lv_font_roboto_28.c lvgl/src/lv_font/lv_font_roboto_28_compressed.c lvgl/src/lv_font/lv_font_unscii_8.c lvgl/src/lv_hal/lv_hal_disp.c lvgl/src/lv_hal/lv_hal_indev.c lvgl/src/lv_hal/lv_hal_tick.c lvgl/src/lv_misc/lv_anim.c lvgl/src/lv_misc/lv_area.c lvgl/src/lv_misc/lv_async.c lvgl/src/lv_misc/lv_bidi.c lvgl/src/lv_misc/lv_circ.c lvgl/src/lv_misc/lv_color.c lvgl/src/lv_misc/lv_fs.c lvgl/src/lv_misc/lv_gc.c lvgl/src/lv_misc/lv_ll.c lvgl/src/lv_misc/lv_log.c lvgl/src/lv_misc/lv_math.c lvgl/src/lv_misc/lv_mem.c lvgl/src/lv_misc/lv_printf.c lvgl/src/lv_misc/lv_task.c lvgl/src/lv_misc/lv_templ.c lvgl/src/lv_misc/lv_txt.c lvgl/src/lv_misc/lv_utils.c lvgl/src/lv_objx/lv_arc.c lvgl/src/lv_objx/lv_bar.c lvgl/src/lv_objx/lv_btn.c lvgl/src/lv_objx/lv_btnm.c lvgl/src/lv_objx/lv_calendar.c lvgl/src/lv_objx/lv_canvas.c lvgl/src/lv_objx/lv_cb.c lvgl/src/lv_objx/lv_chart.c lvgl/src/lv_objx/lv_cont.c lvgl/src/lv_objx/lv_cpicker.c lvgl/src/lv_objx/lv_ddlist.c lvgl/src/lv_objx/lv_gauge.c lvgl/src/lv_objx/lv_img.c lvgl/src/lv_objx/lv_imgbtn.c lvgl/src/lv_objx/lv_kb.c lvgl/src/lv_objx/lv_label.c lvgl/src/lv_objx/lv_led.c lvgl/src/lv_objx/lv_line.c lvgl/src/lv_objx/lv_list.c lvgl/src/lv_objx/lv_lmeter.c lvgl/src/lv_objx/lv_mbox.c lvgl/src/lv_objx/lv_objx_templ.c lvgl/src/lv_objx/lv_page.c lvgl/src/lv_objx/lv_preload.c lvgl/src/lv_objx/lv_roller.c lvgl/src/lv_objx/lv_slider.c lvgl/src/lv_objx/lv_spinbox.c lvgl/src/lv_objx/lv_sw.c lvgl/src/lv_objx/lv_ta.c lvgl/src/lv_objx/lv_table.c lvgl/src/lv_objx/lv_tabview.c lvgl/src/lv_objx/lv_tileview.c lvgl/src/lv_objx/lv_win.c lvgl/src/lv_themes/lv_theme.c lvgl/src/lv_themes/lv_theme_alien.c lvgl/src/lv_themes/lv_theme_default.c lvgl/src/lv_themes/lv_theme_material.c lvgl/src/lv_themes/lv_theme_mono.c lvgl/src/lv_themes/lv_theme_nemo.c lvgl/src/lv_themes/lv_theme_night.c lvgl/src/lv_themes/lv_theme_templ.c lvgl/src/lv_themes/lv_theme_zen.c main.c RA8875.c delay.c uart.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o: lvgl/porting/lv_port_disp_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o lvgl/porting/lv_port_disp_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o: lvgl/porting/lv_port_fs_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o lvgl/porting/lv_port_fs_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o: lvgl/porting/lv_port_indev_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o lvgl/porting/lv_port_indev_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o: lvgl/src/lv_core/lv_debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o lvgl/src/lv_core/lv_debug.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o: lvgl/src/lv_core/lv_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o lvgl/src/lv_core/lv_disp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_group.o: lvgl/src/lv_core/lv_group.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o lvgl/src/lv_core/lv_group.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o: lvgl/src/lv_core/lv_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o lvgl/src/lv_core/lv_indev.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o: lvgl/src/lv_core/lv_obj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o lvgl/src/lv_core/lv_obj.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o: lvgl/src/lv_core/lv_refr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o lvgl/src/lv_core/lv_refr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_style.o: lvgl/src/lv_core/lv_style.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o lvgl/src/lv_core/lv_style.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o: lvgl/src/lv_draw/lv_draw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o lvgl/src/lv_draw/lv_draw.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o: lvgl/src/lv_draw/lv_draw_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o lvgl/src/lv_draw/lv_draw_arc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o: lvgl/src/lv_draw/lv_draw_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o lvgl/src/lv_draw/lv_draw_basic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o: lvgl/src/lv_draw/lv_draw_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o lvgl/src/lv_draw/lv_draw_img.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o: lvgl/src/lv_draw/lv_draw_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o lvgl/src/lv_draw/lv_draw_label.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o: lvgl/src/lv_draw/lv_draw_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o lvgl/src/lv_draw/lv_draw_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o: lvgl/src/lv_draw/lv_draw_rect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o lvgl/src/lv_draw/lv_draw_rect.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o: lvgl/src/lv_draw/lv_draw_triangle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o lvgl/src/lv_draw/lv_draw_triangle.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o: lvgl/src/lv_draw/lv_img_cache.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o lvgl/src/lv_draw/lv_img_cache.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o: lvgl/src/lv_draw/lv_img_decoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o lvgl/src/lv_draw/lv_img_decoder.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font.o: lvgl/src/lv_font/lv_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o lvgl/src/lv_font/lv_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o: lvgl/src/lv_font/lv_font_fmt_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o lvgl/src/lv_font/lv_font_fmt_txt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o: lvgl/src/lv_font/lv_font_roboto_12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o lvgl/src/lv_font/lv_font_roboto_12.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o: lvgl/src/lv_font/lv_font_roboto_12_subpx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o lvgl/src/lv_font/lv_font_roboto_12_subpx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o: lvgl/src/lv_font/lv_font_roboto_16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o lvgl/src/lv_font/lv_font_roboto_16.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o: lvgl/src/lv_font/lv_font_roboto_22.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o lvgl/src/lv_font/lv_font_roboto_22.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o: lvgl/src/lv_font/lv_font_roboto_28.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o lvgl/src/lv_font/lv_font_roboto_28.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o: lvgl/src/lv_font/lv_font_roboto_28_compressed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o lvgl/src/lv_font/lv_font_roboto_28_compressed.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o: lvgl/src/lv_font/lv_font_unscii_8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o lvgl/src/lv_font/lv_font_unscii_8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o: lvgl/src/lv_hal/lv_hal_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o lvgl/src/lv_hal/lv_hal_disp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o: lvgl/src/lv_hal/lv_hal_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o lvgl/src/lv_hal/lv_hal_indev.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o: lvgl/src/lv_hal/lv_hal_tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o lvgl/src/lv_hal/lv_hal_tick.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o: lvgl/src/lv_misc/lv_anim.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o lvgl/src/lv_misc/lv_anim.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o: lvgl/src/lv_misc/lv_area.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o lvgl/src/lv_misc/lv_area.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o: lvgl/src/lv_misc/lv_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o lvgl/src/lv_misc/lv_async.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o: lvgl/src/lv_misc/lv_bidi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o lvgl/src/lv_misc/lv_bidi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o: lvgl/src/lv_misc/lv_circ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o lvgl/src/lv_misc/lv_circ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o: lvgl/src/lv_misc/lv_color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o lvgl/src/lv_misc/lv_color.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o: lvgl/src/lv_misc/lv_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o lvgl/src/lv_misc/lv_fs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o: lvgl/src/lv_misc/lv_gc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o lvgl/src/lv_misc/lv_gc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o: lvgl/src/lv_misc/lv_ll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o lvgl/src/lv_misc/lv_ll.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o: lvgl/src/lv_misc/lv_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o lvgl/src/lv_misc/lv_log.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o: lvgl/src/lv_misc/lv_math.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o lvgl/src/lv_misc/lv_math.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o: lvgl/src/lv_misc/lv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o lvgl/src/lv_misc/lv_mem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o: lvgl/src/lv_misc/lv_printf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o lvgl/src/lv_misc/lv_printf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o: lvgl/src/lv_misc/lv_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o lvgl/src/lv_misc/lv_task.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o: lvgl/src/lv_misc/lv_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o lvgl/src/lv_misc/lv_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o: lvgl/src/lv_misc/lv_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o lvgl/src/lv_misc/lv_txt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o: lvgl/src/lv_misc/lv_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o lvgl/src/lv_misc/lv_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o: lvgl/src/lv_objx/lv_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o lvgl/src/lv_objx/lv_arc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o: lvgl/src/lv_objx/lv_bar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o lvgl/src/lv_objx/lv_bar.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o: lvgl/src/lv_objx/lv_btn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o lvgl/src/lv_objx/lv_btn.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o: lvgl/src/lv_objx/lv_btnm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o lvgl/src/lv_objx/lv_btnm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o: lvgl/src/lv_objx/lv_calendar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o lvgl/src/lv_objx/lv_calendar.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o: lvgl/src/lv_objx/lv_canvas.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o lvgl/src/lv_objx/lv_canvas.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o: lvgl/src/lv_objx/lv_cb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o lvgl/src/lv_objx/lv_cb.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o: lvgl/src/lv_objx/lv_chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o lvgl/src/lv_objx/lv_chart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o: lvgl/src/lv_objx/lv_cont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o lvgl/src/lv_objx/lv_cont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o: lvgl/src/lv_objx/lv_cpicker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o lvgl/src/lv_objx/lv_cpicker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o: lvgl/src/lv_objx/lv_ddlist.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o lvgl/src/lv_objx/lv_ddlist.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o: lvgl/src/lv_objx/lv_gauge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o lvgl/src/lv_objx/lv_gauge.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o: lvgl/src/lv_objx/lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o lvgl/src/lv_objx/lv_img.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o: lvgl/src/lv_objx/lv_imgbtn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o lvgl/src/lv_objx/lv_imgbtn.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o: lvgl/src/lv_objx/lv_kb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o lvgl/src/lv_objx/lv_kb.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o: lvgl/src/lv_objx/lv_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o lvgl/src/lv_objx/lv_label.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o: lvgl/src/lv_objx/lv_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o lvgl/src/lv_objx/lv_led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o: lvgl/src/lv_objx/lv_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o lvgl/src/lv_objx/lv_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o: lvgl/src/lv_objx/lv_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o lvgl/src/lv_objx/lv_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o: lvgl/src/lv_objx/lv_lmeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o lvgl/src/lv_objx/lv_lmeter.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o: lvgl/src/lv_objx/lv_mbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o lvgl/src/lv_objx/lv_mbox.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o: lvgl/src/lv_objx/lv_objx_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o lvgl/src/lv_objx/lv_objx_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o: lvgl/src/lv_objx/lv_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o lvgl/src/lv_objx/lv_page.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o: lvgl/src/lv_objx/lv_preload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o lvgl/src/lv_objx/lv_preload.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o: lvgl/src/lv_objx/lv_roller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o lvgl/src/lv_objx/lv_roller.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o: lvgl/src/lv_objx/lv_slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o lvgl/src/lv_objx/lv_slider.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o: lvgl/src/lv_objx/lv_spinbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o lvgl/src/lv_objx/lv_spinbox.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o: lvgl/src/lv_objx/lv_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o lvgl/src/lv_objx/lv_sw.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o: lvgl/src/lv_objx/lv_ta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o lvgl/src/lv_objx/lv_ta.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o: lvgl/src/lv_objx/lv_table.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o lvgl/src/lv_objx/lv_table.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o: lvgl/src/lv_objx/lv_tabview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o lvgl/src/lv_objx/lv_tabview.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o: lvgl/src/lv_objx/lv_tileview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o lvgl/src/lv_objx/lv_tileview.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o: lvgl/src/lv_objx/lv_win.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o lvgl/src/lv_objx/lv_win.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o: lvgl/src/lv_themes/lv_theme.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o lvgl/src/lv_themes/lv_theme.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o: lvgl/src/lv_themes/lv_theme_alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o lvgl/src/lv_themes/lv_theme_alien.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o: lvgl/src/lv_themes/lv_theme_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o lvgl/src/lv_themes/lv_theme_default.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o: lvgl/src/lv_themes/lv_theme_material.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o lvgl/src/lv_themes/lv_theme_material.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o: lvgl/src/lv_themes/lv_theme_mono.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o lvgl/src/lv_themes/lv_theme_mono.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o: lvgl/src/lv_themes/lv_theme_nemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o lvgl/src/lv_themes/lv_theme_nemo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o: lvgl/src/lv_themes/lv_theme_night.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o lvgl/src/lv_themes/lv_theme_night.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o: lvgl/src/lv_themes/lv_theme_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o lvgl/src/lv_themes/lv_theme_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o: lvgl/src/lv_themes/lv_theme_zen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o lvgl/src/lv_themes/lv_theme_zen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/RA8875.o: RA8875.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RA8875.o.d 
	@${RM} ${OBJECTDIR}/RA8875.o 
	@${FIXDEPS} "${OBJECTDIR}/RA8875.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/RA8875.o.d" -o ${OBJECTDIR}/RA8875.o RA8875.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/delay.o: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay.o.d 
	@${RM} ${OBJECTDIR}/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/delay.o.d" -o ${OBJECTDIR}/delay.o delay.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
else
${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o: lvgl/porting/lv_port_disp_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_disp_template.o lvgl/porting/lv_port_disp_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o: lvgl/porting/lv_port_fs_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_fs_template.o lvgl/porting/lv_port_fs_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o: lvgl/porting/lv_port_indev_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/porting" 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d 
	@${RM} ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o.d" -o ${OBJECTDIR}/lvgl/porting/lv_port_indev_template.o lvgl/porting/lv_port_indev_template.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o: lvgl/src/lv_core/lv_debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_debug.o lvgl/src/lv_core/lv_debug.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o: lvgl/src/lv_core/lv_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_disp.o lvgl/src/lv_core/lv_disp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_group.o: lvgl/src/lv_core/lv_group.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_group.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_group.o lvgl/src/lv_core/lv_group.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o: lvgl/src/lv_core/lv_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_indev.o lvgl/src/lv_core/lv_indev.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o: lvgl/src/lv_core/lv_obj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_obj.o lvgl/src/lv_core/lv_obj.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o: lvgl/src/lv_core/lv_refr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_refr.o lvgl/src/lv_core/lv_refr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_core/lv_style.o: lvgl/src/lv_core/lv_style.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_core/lv_style.o.d" -o ${OBJECTDIR}/lvgl/src/lv_core/lv_style.o lvgl/src/lv_core/lv_style.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o: lvgl/src/lv_draw/lv_draw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw.o lvgl/src/lv_draw/lv_draw.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o: lvgl/src/lv_draw/lv_draw_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_arc.o lvgl/src/lv_draw/lv_draw_arc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o: lvgl/src/lv_draw/lv_draw_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_basic.o lvgl/src/lv_draw/lv_draw_basic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o: lvgl/src/lv_draw/lv_draw_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_img.o lvgl/src/lv_draw/lv_draw_img.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o: lvgl/src/lv_draw/lv_draw_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_label.o lvgl/src/lv_draw/lv_draw_label.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o: lvgl/src/lv_draw/lv_draw_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_line.o lvgl/src/lv_draw/lv_draw_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o: lvgl/src/lv_draw/lv_draw_rect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_rect.o lvgl/src/lv_draw/lv_draw_rect.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o: lvgl/src/lv_draw/lv_draw_triangle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_draw_triangle.o lvgl/src/lv_draw/lv_draw_triangle.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o: lvgl/src/lv_draw/lv_img_cache.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_cache.o lvgl/src/lv_draw/lv_img_cache.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o: lvgl/src/lv_draw/lv_img_decoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o.d" -o ${OBJECTDIR}/lvgl/src/lv_draw/lv_img_decoder.o lvgl/src/lv_draw/lv_img_decoder.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font.o: lvgl/src/lv_font/lv_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font.o lvgl/src/lv_font/lv_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o: lvgl/src/lv_font/lv_font_fmt_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_fmt_txt.o lvgl/src/lv_font/lv_font_fmt_txt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o: lvgl/src/lv_font/lv_font_roboto_12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12.o lvgl/src/lv_font/lv_font_roboto_12.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o: lvgl/src/lv_font/lv_font_roboto_12_subpx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_12_subpx.o lvgl/src/lv_font/lv_font_roboto_12_subpx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o: lvgl/src/lv_font/lv_font_roboto_16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_16.o lvgl/src/lv_font/lv_font_roboto_16.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o: lvgl/src/lv_font/lv_font_roboto_22.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_22.o lvgl/src/lv_font/lv_font_roboto_22.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o: lvgl/src/lv_font/lv_font_roboto_28.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28.o lvgl/src/lv_font/lv_font_roboto_28.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o: lvgl/src/lv_font/lv_font_roboto_28_compressed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_roboto_28_compressed.o lvgl/src/lv_font/lv_font_roboto_28_compressed.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o: lvgl/src/lv_font/lv_font_unscii_8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o.d" -o ${OBJECTDIR}/lvgl/src/lv_font/lv_font_unscii_8.o lvgl/src/lv_font/lv_font_unscii_8.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o: lvgl/src/lv_hal/lv_hal_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_disp.o lvgl/src/lv_hal/lv_hal_disp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o: lvgl/src/lv_hal/lv_hal_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_indev.o lvgl/src/lv_hal/lv_hal_indev.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o: lvgl/src/lv_hal/lv_hal_tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o.d" -o ${OBJECTDIR}/lvgl/src/lv_hal/lv_hal_tick.o lvgl/src/lv_hal/lv_hal_tick.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o: lvgl/src/lv_misc/lv_anim.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_anim.o lvgl/src/lv_misc/lv_anim.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o: lvgl/src/lv_misc/lv_area.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_area.o lvgl/src/lv_misc/lv_area.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o: lvgl/src/lv_misc/lv_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_async.o lvgl/src/lv_misc/lv_async.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o: lvgl/src/lv_misc/lv_bidi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_bidi.o lvgl/src/lv_misc/lv_bidi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o: lvgl/src/lv_misc/lv_circ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_circ.o lvgl/src/lv_misc/lv_circ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o: lvgl/src/lv_misc/lv_color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_color.o lvgl/src/lv_misc/lv_color.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o: lvgl/src/lv_misc/lv_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_fs.o lvgl/src/lv_misc/lv_fs.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o: lvgl/src/lv_misc/lv_gc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_gc.o lvgl/src/lv_misc/lv_gc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o: lvgl/src/lv_misc/lv_ll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_ll.o lvgl/src/lv_misc/lv_ll.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o: lvgl/src/lv_misc/lv_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_log.o lvgl/src/lv_misc/lv_log.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o: lvgl/src/lv_misc/lv_math.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_math.o lvgl/src/lv_misc/lv_math.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o: lvgl/src/lv_misc/lv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_mem.o lvgl/src/lv_misc/lv_mem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o: lvgl/src/lv_misc/lv_printf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_printf.o lvgl/src/lv_misc/lv_printf.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o: lvgl/src/lv_misc/lv_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_task.o lvgl/src/lv_misc/lv_task.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o: lvgl/src/lv_misc/lv_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_templ.o lvgl/src/lv_misc/lv_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o: lvgl/src/lv_misc/lv_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_txt.o lvgl/src/lv_misc/lv_txt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o: lvgl/src/lv_misc/lv_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o.d" -o ${OBJECTDIR}/lvgl/src/lv_misc/lv_utils.o lvgl/src/lv_misc/lv_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o: lvgl/src/lv_objx/lv_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_arc.o lvgl/src/lv_objx/lv_arc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o: lvgl/src/lv_objx/lv_bar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_bar.o lvgl/src/lv_objx/lv_bar.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o: lvgl/src/lv_objx/lv_btn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btn.o lvgl/src/lv_objx/lv_btn.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o: lvgl/src/lv_objx/lv_btnm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_btnm.o lvgl/src/lv_objx/lv_btnm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o: lvgl/src/lv_objx/lv_calendar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_calendar.o lvgl/src/lv_objx/lv_calendar.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o: lvgl/src/lv_objx/lv_canvas.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_canvas.o lvgl/src/lv_objx/lv_canvas.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o: lvgl/src/lv_objx/lv_cb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cb.o lvgl/src/lv_objx/lv_cb.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o: lvgl/src/lv_objx/lv_chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_chart.o lvgl/src/lv_objx/lv_chart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o: lvgl/src/lv_objx/lv_cont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cont.o lvgl/src/lv_objx/lv_cont.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o: lvgl/src/lv_objx/lv_cpicker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_cpicker.o lvgl/src/lv_objx/lv_cpicker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o: lvgl/src/lv_objx/lv_ddlist.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ddlist.o lvgl/src/lv_objx/lv_ddlist.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o: lvgl/src/lv_objx/lv_gauge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_gauge.o lvgl/src/lv_objx/lv_gauge.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o: lvgl/src/lv_objx/lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_img.o lvgl/src/lv_objx/lv_img.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o: lvgl/src/lv_objx/lv_imgbtn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_imgbtn.o lvgl/src/lv_objx/lv_imgbtn.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o: lvgl/src/lv_objx/lv_kb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_kb.o lvgl/src/lv_objx/lv_kb.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o: lvgl/src/lv_objx/lv_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_label.o lvgl/src/lv_objx/lv_label.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o: lvgl/src/lv_objx/lv_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_led.o lvgl/src/lv_objx/lv_led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o: lvgl/src/lv_objx/lv_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_line.o lvgl/src/lv_objx/lv_line.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o: lvgl/src/lv_objx/lv_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_list.o lvgl/src/lv_objx/lv_list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o: lvgl/src/lv_objx/lv_lmeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_lmeter.o lvgl/src/lv_objx/lv_lmeter.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o: lvgl/src/lv_objx/lv_mbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_mbox.o lvgl/src/lv_objx/lv_mbox.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o: lvgl/src/lv_objx/lv_objx_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_objx_templ.o lvgl/src/lv_objx/lv_objx_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o: lvgl/src/lv_objx/lv_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_page.o lvgl/src/lv_objx/lv_page.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o: lvgl/src/lv_objx/lv_preload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_preload.o lvgl/src/lv_objx/lv_preload.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o: lvgl/src/lv_objx/lv_roller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_roller.o lvgl/src/lv_objx/lv_roller.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o: lvgl/src/lv_objx/lv_slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_slider.o lvgl/src/lv_objx/lv_slider.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o: lvgl/src/lv_objx/lv_spinbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_spinbox.o lvgl/src/lv_objx/lv_spinbox.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o: lvgl/src/lv_objx/lv_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_sw.o lvgl/src/lv_objx/lv_sw.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o: lvgl/src/lv_objx/lv_ta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_ta.o lvgl/src/lv_objx/lv_ta.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o: lvgl/src/lv_objx/lv_table.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_table.o lvgl/src/lv_objx/lv_table.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o: lvgl/src/lv_objx/lv_tabview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tabview.o lvgl/src/lv_objx/lv_tabview.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o: lvgl/src/lv_objx/lv_tileview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_tileview.o lvgl/src/lv_objx/lv_tileview.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o: lvgl/src/lv_objx/lv_win.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o.d" -o ${OBJECTDIR}/lvgl/src/lv_objx/lv_win.o lvgl/src/lv_objx/lv_win.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o: lvgl/src/lv_themes/lv_theme.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme.o lvgl/src/lv_themes/lv_theme.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o: lvgl/src/lv_themes/lv_theme_alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_alien.o lvgl/src/lv_themes/lv_theme_alien.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o: lvgl/src/lv_themes/lv_theme_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_default.o lvgl/src/lv_themes/lv_theme_default.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o: lvgl/src/lv_themes/lv_theme_material.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_material.o lvgl/src/lv_themes/lv_theme_material.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o: lvgl/src/lv_themes/lv_theme_mono.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_mono.o lvgl/src/lv_themes/lv_theme_mono.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o: lvgl/src/lv_themes/lv_theme_nemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_nemo.o lvgl/src/lv_themes/lv_theme_nemo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o: lvgl/src/lv_themes/lv_theme_night.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_night.o lvgl/src/lv_themes/lv_theme_night.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o: lvgl/src/lv_themes/lv_theme_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_templ.o lvgl/src/lv_themes/lv_theme_templ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o: lvgl/src/lv_themes/lv_theme_zen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d 
	@${RM} ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o 
	@${FIXDEPS} "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o.d" -o ${OBJECTDIR}/lvgl/src/lv_themes/lv_theme_zen.o lvgl/src/lv_themes/lv_theme_zen.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/RA8875.o: RA8875.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RA8875.o.d 
	@${RM} ${OBJECTDIR}/RA8875.o 
	@${FIXDEPS} "${OBJECTDIR}/RA8875.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/RA8875.o.d" -o ${OBJECTDIR}/RA8875.o RA8875.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/delay.o: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay.o.d 
	@${RM} ${OBJECTDIR}/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/delay.o.d" -o ${OBJECTDIR}/delay.o delay.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/teste_lvgl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
