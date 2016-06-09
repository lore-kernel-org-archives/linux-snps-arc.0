From: daniel@ffwll.ch (Daniel Vetter)
Date: Thu, 9 Jun 2016 16:37:27 +0200
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <CAKMK7uGmLNhJmtT+FyZ-uyGbv2Th96hJfqMUEStjqp3HKYdjMg@mail.gmail.com>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-3-git-send-email-daniel.vetter@ffwll.ch>
 <a29a4f82-1699-1c33-73ea-5b8043b53e35@linux.intel.com>
 <20160608143004.GE3363@phenom.ffwll.local>
 <1465469639.3203.57.camel@synopsys.com>
 <20160609122631.GO3363@phenom.ffwll.local>
 <1465476465.3203.66.camel@synopsys.com>
 <20160609132327.GQ3363@phenom.ffwll.local>
 <1465478829.3203.68.camel@synopsys.com>
 <20160609135222.GS3363@phenom.ffwll.local>
 <1465482496.3203.73.camel@synopsys.com>
 <CAKMK7uGmLNhJmtT+FyZ-uyGbv2Th96hJfqMUEStjqp3HKYdjMg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKMK7uGjoLcKib6zXnO5wFBzOvKhbWZg9o8zi_BwA+vNGDoToA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Jun 9, 2016@4:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jun 9, 2016 at 4:29 PM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
>> Hi Daniel,
>>
>> On Thu, 2016-06-09@15:52 +0200, Daniel Vetter wrote:
>>>
>>> The fake implementation is fundamentally racy, and I don't want to write
>>> helpers which can't be used correctly. Anyway I think without this patch
>>> (or something similar) arcpgu will stall badly with the new nonblocking
>>> helpers, because arcpgu didn't bother at all to implement nonblocking. Can
>>> you pls ack this, or even better, test the entire patch series? The
>>> helpers themselves should work, but in all 5 drivers tested thus far they
>>> discovered some bugs.
>>
>> Sure I will happily test this series.
>> The only question then is what should I use as a proper base?
>
> It should apply on drm-next from Dave.

And indeed it won't work at all because arcpgu doesn't call
drm_crtc_handle_vblank anywhere. So you need to add your patch to
enable vblank interrupts somewhere. Note that as long as you leave
max_vblank_counter as 0, the only bits you need is drm_vblank_init and
drm_crtc_handle_vblanke() from the irq handler.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
