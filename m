From: blackzert@gmail.com (Ilya Smith)
Date: Thu, 29 Mar 2018 00:07:35 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180327234904.GA27734@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <B26CA69E-B804-4607-9697-853DFE24C616@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 28 Mar 2018,@02:49, Matthew Wilcox <willy@infradead.org> wrote:
> 
> On Tue, Mar 27, 2018@03:53:53PM -0700, Kees Cook wrote:
>> I agree: pushing this off to libc leaves a lot of things unprotected.
>> I think this should live in the kernel. The question I have is about
>> making it maintainable/readable/etc.
>> 
>> The state-of-the-art for ASLR is moving to finer granularity (over
>> just base-address offset), so I'd really like to see this supported in
>> the kernel. We'll be getting there for other things in the future, and
>> I'd like to have a working production example for researchers to
>> study, etc.
> 
> One thing we need is to limit the fragmentation of this approach.
> Even on 64-bit systems, we can easily get into a situation where there isn't
> space to map a contiguous terabyte.

As I wrote before, shift_random is introduced to be fragmentation limit. Even 
without it, the main question here is ?if we can?t allocate memory with N size 
bytes, how many bytes we already allocated??. From these point of view I 
already showed in previous version of patch that if application uses not so big 
memory allocations, it will have enough memory to use. If it uses XX Gigabytes 
or Terabytes memory, this application has all chances to be exploited with 
fully randomization or without. Since it is much easier to find(or guess) any 
usable pointer, etc. For the instance you have only 128 terabytes of memory for 
user space, so probability to exploit this application is 1/128 what is not 
secure at all. This is very rough estimate but I try to make things easier to 
understand.

Best regards,
Ilya
