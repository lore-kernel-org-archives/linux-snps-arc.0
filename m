From: amitkarwar@gmail.com (Amitkumar Karwar)
Date: Wed, 6 Dec 2017 12:43:36 +0530
Subject: rsi_91x: Failed to read status register on failed authentication
In-Reply-To: <1512490314.4977.143.camel@synopsys.com>
References: <1512490314.4977.143.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAEhWJF=1GU9vOj5+DeJCOjbbh4zh_OMyv2HKH_1XT3XP2auFUg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Dec 5, 2017 at 9:41 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Amit,
>
> I'm seeing quite a strange behavior of RedPine module.
> It connects perfectly fine to one of access points but fails
> to connect to another.
>
> Moreover after that failure RSI driver starts to flood me with
> messages saying:
> --------------------->8--------------------
> rsi_91x: rsi_sdio_check_buffer_status: Failed to read status register
> --------------------->8--------------------
>
> Below you may find details of my 2 experiments.
> Note I use vanilla Linux kernel v4.14.4
>
> Any ideas what could be wrong?
>

Could you enable driver debug zones and share dmesg log for analysis?

echo 0xffffffff > /sys/kernel/debug/phy0/debug_zone

Regards,
Amitkumar
