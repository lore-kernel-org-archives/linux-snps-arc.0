From: tony.luck@intel.com (Luck, Tony)
Date: Wed, 28 Mar 2018 21:07:30 +0000
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180328000025.GM1436@brightrain.aerifal.cx>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
 <20180328000025.GM1436@brightrain.aerifal.cx>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7B3B8BC5@ORSMSX110.amr.corp.intel.com>
To: linux-snps-arc@lists.infradead.org

> The default limit of only 65536 VMAs will also quickly come into play
> if consecutive anon mmaps don't get merged. Of course this can be
> raised, but it has significant resource and performance (fork) costs.

Could the random mmap address chooser look for how many existing
VMAs have space before/after and the right attributes to merge with the
new one you want to create? If this is above some threshold (100?) then
pick one of them randomly and allocate the new address so that it will
merge from below/above with an existing one.

That should still give you a very high degree of randomness, but prevent
out of control numbers of VMAs from being created.

-Tony
