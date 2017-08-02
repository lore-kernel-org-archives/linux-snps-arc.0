From: alexdeucher@gmail.com (Alex Deucher)
Date: Wed, 2 Aug 2017 14:24:08 -0400
Subject: Please pull ARCPGU changes
In-Reply-To: <1501668977.6345.35.camel@synopsys.com>
References: <1501499465.6216.4.camel@synopsys.com>
 <20170802094133.eethtbpa2okhz44f@phenom.ffwll.local>
 <1501668977.6345.35.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CADnq5_OSnPGKv35Aogf8pmtoH=w8pDKwttf3hW6MD9=s=yhZjw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Aug 2, 2017 at 6:16 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Daniel,
>
> On Wed, 2017-08-02@11:41 +0200, Daniel Vetter wrote:
>> On Mon, Jul 31, 2017@11:11:06AM +0000, Alexey Brodkin wrote:
>> >
>> > Hi Dave,
>> >
>> > Could you please pull a couple of minor fixes for ARCPGU.
>> > These changes are based on today's drm-misc/drm-misc-next.
>>
>> You can't send Dave a pull based on a random snapshot of drm-misc-next. If
>> you want to maintain your driver on top of drm-misc, then become part of
>> the group (arcgpu would fit imo). Otherwise you need to base your pulls on
>> top of Dave's tree.
>
> I don't have any specific requirement for "drm-misc-next" to b used as a base.
> That said Dave trees are OK for me. Still could you please point me to
> his "for-curr" and "for-next" (or equivalent) trees?

next:
https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next

fixes:
https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-fixes

Alex

>
>> Also, your pull is missing the [PULL] tag in the
>> subject.
>
> Sorry for that, will fix it in the next request.
>
> -Alexey
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
