From: ross.burton@intel.com (Burton, Ross)
Date: Thu, 15 Nov 2018 15:00:33 +0000
Subject: [PATCH v2] u-boot: Add mkenvimage tool
In-Reply-To: <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
 <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 15 Nov 2018@14:50, Marek Vasut <marex@denx.de> wrote:
> I have to admit, the recipe name becomes a misnomer then. But renaming
> this recipe would be hard, since it's used all over the place. Any ideas?

Call it u-boot-tools, potentially merge the other recipe tool, and add
RPROVIDES for compatibility?

Ross
