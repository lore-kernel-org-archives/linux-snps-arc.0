From: marex@denx.de (Marek Vasut)
Date: Thu, 15 Nov 2018 16:06:45 +0100
Subject: [PATCH v2] u-boot: Add mkenvimage tool
In-Reply-To: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
 <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
 <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b93175dc-79af-0cda-b975-c4bb429459bf@denx.de>
To: linux-snps-arc@lists.infradead.org

On 11/15/2018 04:00 PM, Burton, Ross wrote:
> On Thu, 15 Nov 2018@14:50, Marek Vasut <marex@denx.de> wrote:
>> I have to admit, the recipe name becomes a misnomer then. But renaming
>> this recipe would be hard, since it's used all over the place. Any ideas?
> 
> Call it u-boot-tools, potentially merge the other recipe tool, and add
> RPROVIDES for compatibility?

Ah :-)

I wonder if it'd make sense to have this new recipe generate multiple
packages, one per tool ?

-- 
Best regards,
Marek Vasut
