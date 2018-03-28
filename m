From: blackzert@gmail.com (Ilya Smith)
Date: Wed, 28 Mar 2018 21:48:22 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180327221635.GA3790@thunk.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <20180327221635.GA3790@thunk.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <B217D90A-6200-4257-804A-50D6C0308470@gmail.com>
To: linux-snps-arc@lists.infradead.org

> On 28 Mar 2018,@01:16, Theodore Y. Ts'o <tytso@mit.edu> wrote:
> 
> On Tue, Mar 27, 2018@04:51:08PM +0300, Ilya Smith wrote:
>>> /dev/[u]random is not sufficient?
>> 
>> Using /dev/[u]random makes 3 syscalls - open, read, close. This is a performance
>> issue.
> 
> You may want to take a look at the getrandom(2) system call, which is
> the recommended way getting secure random numbers from the kernel.
> 
>>> Well, I am pretty sure userspace can implement proper free ranges
>>> tracking?
>> 
>> I think we need to know what libc developers will say on implementing ASLR in 
>> user-mode. I am pretty sure they will say ?nether? or ?some-day?. And problem 
>> of ASLR will stay forever.
> 
> Why can't you send patches to the libc developers?
> 
> Regards,
> 
> 						- Ted

I still believe the issue is on kernel side, not in library.

Best regards,
Ilya
