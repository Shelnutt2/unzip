LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
          crc32.c \
          crypt.c \
          envargs.c \
          explode.c \
          extract.c \
          fileio.c \
          globals.c \
          inflate.c \
          list.c \
          match.c \
          process.c \
          ttyio.c \
          ubz2err.c \
          unix/unix.c \
          unreduce.c \
          unshrink.c \
          unzip.c \
          zipinfo.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
        external/bzip2
LOCAL_CFLAGS += -Wno-error=format-security -DANDROID -DUNIX -DBZIP2_SUPPORT -DUIDGID_NOT_16BIT -DUNICODE_SUPPORT -DHAVE_DIRENT_H -DHAVE_TERMIOS_H -DUTF8_MAYBE_NATIVE -DNO_LCHMOD -DNO_LANGINFO_H
LOCAL_STATIC_LIBRARIES := libc libbz
LOCAL_MODULE := unzip
LOCAL_MODULE_TAGS := eng debug
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_FORCE_STATIC_EXECUTABLE := true
include $(BUILD_EXECUTABLE)

$(call dist-for-goals,dist_files,$(LOCAL_BUILT_MODULE))
