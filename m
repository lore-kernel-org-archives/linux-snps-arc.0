From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 4 Dec 2017 11:50:40 +0000
Subject: UDL's fbdev doesn't work for user-space apps
In-Reply-To: <1512387175.4977.24.camel@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On 04-12-2017 11:32, Alexey Brodkin wrote:
> My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> and it cannot use DRI video card natively. Is that correct?
>
>

Xserver can use DRI directly, you need to enable modesetting
driver in Xorg config or use the designated driver for your card
(if there is any).

e.g.:

Section "Device"
        Identifier "Card0"
        Driver "modesetting"
        Option "kmsdev" "/dev/dri/card0"
        Option "SWcursor" "true"
        BusID "PCI:X:X:X"
EndSection

Best Regards,
Jose Miguel Abreu
