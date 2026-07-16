#
# Copyright (C) 2025 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# SEC Floating Feature configuration file for Qualcomm Snapdragon 720G devices (sm7125)

# Enable seamless refresh rate feature
SEC_FLOATING_FEATURE_LCD_CONFIG_HFR_MODE=2

# Enable extra brightness feature
SEC_FLOATING_FEATURE_LCD_SUPPORT_EXTRA_BRIGHTNESS=TRUE

# ImageTagger version
SEC_FLOATING_FEATURE_GALLERY_CONFIG_IMAGE_TAGGER_VERSION=V701

# Always show remaster button in Gallery
SEC_FLOATING_FEATURE_SAIV_CONFIG_AI_REVITAL_VERSION=1.7,1

#AOD Clock transition
SEC_FLOATING_FEATURE_FRAMEWORK_CONFIG_AOD_ITEM=aodversion=7,clocktransition,activeclock=4

# Camera VENDOR_LIB_INFO - match S23FE for post-processing compatibility
SEC_FLOATING_FEATURE_CAMERA_CONFIG_VENDOR_LIB_INFO=beauty.samsung.v4,face_landmark.arcsoft.v2_1,facial_attribute.samsung.v1,swuwdc.arcsoft.v1,event_detection.samsung.v2,food.samsung.v1,selfie_correction.samsung.v1,dual_bokeh.samsung.v1,single_bokeh.samsung.v2,image_enhance.arcsoft.v1,scene_detection.samsung.v1,smart_scan.samsung.v2,mfhdr.arcsoft.v1,llhdr.arcsoft.v1,human_tracking.arcsoft.v2_1,localtm.samsung.v1_1,image_codec.samsung.v2,super_night.mpi.v2,super_resolution_raw.arcsoft.v1,fr_tracking.arcsoft.v1,aebhdr.arcsoft.v1,hybridhdr.arcsoft.v1,pro_single_rgb.mpi.v1,fusion_high_res.arcsoft.v1,facial_restoration.arcsoft.v1
