From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 27 Nov 2018 15:38:51 +0000
Subject: failing ARC builds in kernelCI
In-Reply-To: <CAOi56cX4sV=jD0ctuQROh3r8JtcL4285i-g8k7Ew3knnD3v8Ww@mail.gmail.com>
References: <CAOi56cX4sV=jD0ctuQROh3r8JtcL4285i-g8k7Ew3knnD3v8Ww@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2b7adbb0eeef90de6895889be814fd632e20a22f.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Kevin,

On Tue, 2018-11-27@07:23 -0800, Kevin Hilman wrote:
> Hi Alexey,
> 
> You may have noticed that some defconfigs are failing to build
> upstream for ARC.  For example, on mainline, both allnoconfig and
> tinyconfig fail to build[1].

Actually I haven't seen that!
 1. I used to check https://kernelci.org/soc/ but there's still no mention
    of ARC so I thought builds for ARC are not enabled still.
 2. I haven't seen any email notifications as well if they exist at all.

That said it would be good if warning emails are sent to our mailing-list
linux-snps-arc at lists.infradead.org (see in Cc as well) so somebody reacts on them.


> Do you guys have any plans to fix these, or should we disable them?
> We currently build these for all the other arches.,

Sure, let me take a look right now.

> 
> Kevin
> 
> [1] https://kernelci.org/build/mainline/branch/master/kernel/v4.20-rc4-7-gef78e5ec9214/

-Alexey
