From: luto@amacapital.net (Andy Lutomirski)
Date: Wed, 15 Mar 2017 13:06:50 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170315194447.scsf3fiwvf7z5gzc@arch-dev>
References: <CALCETrX5gv+zdhOYro4-u3wGWjVCab28DFHPSm5=BVG_hKxy3A@mail.gmail.com>
 <20170315194447.scsf3fiwvf7z5gzc@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrXfGgxaLivhci0VL=wUaWAnBiUXC47P7TUaEuOYV_-X_g@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Mar 15, 2017 at 12:44 PM, Till Smejkal
<till.smejkal@googlemail.com> wrote:
> On Wed, 15 Mar 2017, Andy Lutomirski wrote:
>> > One advantage of VAS segments is that they can be globally queried by user programs
>> > which means that VAS segments can be shared by applications that not necessarily have
>> > to be related. If I am not mistaken, MAP_SHARED of pure in memory data will only work
>> > if the tasks that share the memory region are related (aka. have a common parent that
>> > initialized the shared mapping). Otherwise, the shared mapping have to be backed by a
>> > file.
>>
>> What's wrong with memfd_create()?
>>
>> > VAS segments on the other side allow sharing of pure in memory data by
>> > arbitrary related tasks without the need of a file. This becomes especially
>> > interesting if one combines VAS segments with non-volatile memory since one can keep
>> > data structures in the NVM and still be able to share them between multiple tasks.
>>
>> What's wrong with regular mmap?
>
> I never wanted to say that there is something wrong with regular mmap. We just
> figured that with VAS segments you could remove the need to mmap your shared data but
> instead can keep everything purely in memory.

memfd does that.

>
> Unfortunately, I am not at full speed with memfds. Is my understanding correct that
> if the last user of such a file descriptor closes it, the corresponding memory is
> freed? Accordingly, memfd cannot be used to keep data in memory while no program is
> currently using it, can it?

No, stop right here.  If you want to have a bunch of memory that
outlives the program that allocates it, use a filesystem (tmpfs,
hugetlbfs, ext4, whatever).  Don't create new persistent kernel
things.

> VAS segments on the other side would provide a functionality to
> achieve the same without the need of any mounted filesystem. However, I agree, that
> this is just a small advantage compared to what can already be achieved with the
> existing functionality provided by the Linux kernel.

I see this "small advantage" as "resource leak and security problem".

>> This sounds complicated and fragile.  What happens if a heuristically
>> shared region coincides with a region in the "first class address
>> space" being selected?
>
> If such a conflict happens, the task cannot use the first class address space and the
> corresponding system call will return an error. However, with the current available
> virtual address space size that programs can use, such conflicts are probably rare.

A bug that hits 1% of the time is often worse than one that hits 100%
of the time because debugging it is miserable.

--Andy
