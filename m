From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Thu, 19 May 2016 13:34:48 -0700
Subject: [GIT PULL] ARC updates for 4.7-rc1
In-Reply-To: <573D5C31.8010100@synopsys.com>
References: <573D5C31.8010100@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CA+55aFyQ7bzCJ9owuhe9Lmgozhc-_qkjts0majgHqUzY9kQf1Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, May 18, 2016 at 11:24 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
>
> The highlight is support for EZChip (now Mellanox) NPS-400 network processor [..]

Oh, and that brought in the

    drivers/irqchip/irq-eznps.c

driver that is compile-test enabled.

And that driver is not 64-bit clean:

  In file included from drivers/irqchip/irq-eznps.c:39:0:
  include/soc/nps/common.h: In function ?nps_host_reg_non_cl?:
  include/soc/nps/common.h:148:9: warning: cast to pointer from
integer of different size [-Wint-to-pointer-cast]
    return (void *)reg_address.value;
           ^
  include/soc/nps/common.h: In function ?nps_host_reg?:
  include/soc/nps/common.h:162:9: warning: cast to pointer from
integer of different size [-Wint-to-pointer-cast]
    return (void *)reg_address.value;
           ^

so it needs to either be disabled or fixed. Annoying everybody else
with warnings is not an option.

            Linus
