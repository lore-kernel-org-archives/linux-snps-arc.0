From: dmitry.torokhov@gmail.com (Dmitry Torokhov)
Date: Sun, 17 Apr 2016 05:38:57 -0700
Subject: [PATCH V3 00/29] bitops: add parity functions
In-Reply-To: <1460601525-3822-1-git-send-email-zengzhaoxiu@163.com>
References: <1460601525-3822-1-git-send-email-zengzhaoxiu@163.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160417123857.GD33215@dtor-ws>
To: linux-snps-arc@lists.infradead.org

On Thu, Apr 14, 2016@10:36:41AM +0800, zengzhaoxiu@163.com wrote:
>  drivers/input/joystick/grip_mp.c             |  16 +--
>  drivers/input/joystick/sidewinder.c          |  24 +----
>  drivers/input/mouse/elantech.c               |  10 +-
>  drivers/input/mouse/elantech.h               |   1 -
>  drivers/input/serio/ams_delta_serio.c        |   8 +-
>  drivers/input/serio/pcips2.c                 |   2 +-
>  drivers/input/serio/sa1111ps2.c              |   2 +-

For input bits:

Acked-by: Dmitry Torokhov <dmitry.torokhov at gmail.com>

Thanks.

-- 
Dmitry
