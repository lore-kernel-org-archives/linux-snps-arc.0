From: blackzert@gmail.com (Ilya Smith)
Date: Tue, 3 Apr 2018 03:11:50 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7B3B8BC5@ORSMSX110.amr.corp.intel.com>
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
 <3908561D78D1C84285E8C5FCA982C28F7B3B8BC5@ORSMSX110.amr.corp.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <D9173B50-39D6-4EE5-AF8B-3EB50D0C9A3B@gmail.com>
To: linux-snps-arc@lists.infradead.org

> On 29 Mar 2018,@00:07, Luck, Tony <tony.luck@intel.com> wrote:
> 
>> The default limit of only 65536 VMAs will also quickly come into play
>> if consecutive anon mmaps don't get merged. Of course this can be
>> raised, but it has significant resource and performance (fork) costs.
> 
> Could the random mmap address chooser look for how many existing
> VMAs have space before/after and the right attributes to merge with the
> new one you want to create? If this is above some threshold (100?) then
> pick one of them randomly and allocate the new address so that it will
> merge from below/above with an existing one.
> 
> That should still give you a very high degree of randomness, but prevent
> out of control numbers of VMAs from being created.

I think this wouldn?t work. For example these 100 allocation may happened on 
process initialization. But when attacker come to the server all his 
allocations would be made on the predictable offsets from each other. So in 
result we did nothing just decrease performance of first 100 allocations. I 
think I can make ioctl to turn off this randomization per process and it could 
be used if needed. For example if application going to allocate big chunk or 
make big memory pressure, etc.

Best regards,
Ilya
