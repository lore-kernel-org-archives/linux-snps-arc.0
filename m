From: richard.purdie@linuxfoundation.org (richard.purdie@linuxfoundation.org)
Date: Thu, 15 Nov 2018 15:12:05 +0000
Subject: [PATCH v2] u-boot: Add mkenvimage tool
In-Reply-To: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
 <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
 <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <542aa42e3bdbdbe65f951c12a9df2c3a03171a41.camel@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

On Thu, 2018-11-15@15:00 +0000, Burton, Ross wrote:
> On Thu, 15 Nov 2018@14:50, Marek Vasut <marex@denx.de> wrote:
> > I have to admit, the recipe name becomes a misnomer then. But
> > renaming
> > this recipe would be hard, since it's used all over the place. Any
> > ideas?
> 
> Call it u-boot-tools, potentially merge the other recipe tool, and
> add
> RPROVIDES for compatibility?

You mean PROVIDES since we're talking PN namespace, not PACKAGES?

Cheers,

Richard
