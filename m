From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 6 Mar 2017 10:48:46 +0000
Subject: [PATCH] drm/arcpgu: use .mode_fixup instead of .atomic_check
In-Reply-To: <1488569045.2973.14.camel@synopsys.com>
References: <1488475674-6694-1-git-send-email-abrodkin@synopsys.com>
 <20170302195437.mlhzia2q2oav27mr@phenom.ffwll.local>
 <1488547649.2940.5.camel@synopsys.com>
 <873786fc-406e-850d-f9fb-a6c9ba8cf95c@synopsys.com>
 <1488569045.2973.14.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <50bfc375-5f72-3c5e-3442-5ad796c29413@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,


On 03-03-2017 19:24, Alexey Brodkin wrote:
>
> Correct. Otherwise we'll get some modes and devices that
> don't work.
>
> Remember our saga with 74.25 vs 74.40 MHz?
>
> With our PLLs on AXS and HSDK boards we may generate 74.25 MHz clock
> which satisfy some monitors especially those who pass correct EDID to the host.
> But what if EDID is either corrupted or doesn't exist (that's my case with
> some industrial monitor as well as with old DVI monitor)?
>
> In that case Linux kernel attempts to calculate all the values including pixel clock
> but then instead of 74.25 we'll get 74.40 and equipment that used to work is no longer useful.
>
> So strictly speaking existing check makes perfect sense. But it reduces
> compatibility with not very good monitors.
>
> Probably better solution to the problem is just to throw away [my] faulty HW and
> buy equipment that conforms to standards (not really sure if EDID is a hard
> requirement for DVI/HDMI displays or this is just an option).

Hmm, per DVI and HDMI spec all compliant equipment must support
the EDID. So, either you don't have a compliant equipment or the
EDID is faulty (maybe wrong checksum), if you activate full debug
in drm core you can see the list of probed modes from EDID.

Anyway, per spec they must support EDID, otherwise you won't know
what modes the display support. I think its not very portable to
force a mode because it may not work in some displays. Or, if you
want to make sure it is always works choose 640x480 at 60 because (I
think) both DVI and HDMI displays must support this mode (though
this would need to change at boot [or at runtime, once AXS PLL
driver is in] the clock frequency from 74 to 25Mhz).

>
> BTW I'm wondering if there're any guidelines on what could be pixel clock
> deviation from the requested one?

The "flavours" of pixel clock are already handled by drm core (in
cea_mode_alternate_clock()) and I think the mode that is passed
to the drivers has always the corrected value (i.e. the value may
vary when you have 60Hz or 59.94Hz, for example, but only the
60Hz value will be passed to the driver).

Best regards,
Jose Miguel Abreu

>
> -Alexey
