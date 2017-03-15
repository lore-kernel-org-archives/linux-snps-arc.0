From: dalias@libc.org (Rich Felker)
Date: Wed, 15 Mar 2017 15:47:23 -0400
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170315194447.scsf3fiwvf7z5gzc@arch-dev>
References: <CALCETrX5gv+zdhOYro4-u3wGWjVCab28DFHPSm5=BVG_hKxy3A@mail.gmail.com>
 <20170315194447.scsf3fiwvf7z5gzc@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170315194723.GJ1693@brightrain.aerifal.cx>
To: linux-snps-arc@lists.infradead.org

On Wed, Mar 15, 2017@12:44:47PM -0700, Till Smejkal wrote:
> On Wed, 15 Mar 2017, Andy Lutomirski wrote:
> > > One advantage of VAS segments is that they can be globally queried by user programs
> > > which means that VAS segments can be shared by applications that not necessarily have
> > > to be related. If I am not mistaken, MAP_SHARED of pure in memory data will only work
> > > if the tasks that share the memory region are related (aka. have a common parent that
> > > initialized the shared mapping). Otherwise, the shared mapping have to be backed by a
> > > file.
> > 
> > What's wrong with memfd_create()?
> > 
> > > VAS segments on the other side allow sharing of pure in memory data by
> > > arbitrary related tasks without the need of a file. This becomes especially
> > > interesting if one combines VAS segments with non-volatile memory since one can keep
> > > data structures in the NVM and still be able to share them between multiple tasks.
> > 
> > What's wrong with regular mmap?
> 
> I never wanted to say that there is something wrong with regular mmap. We just
> figured that with VAS segments you could remove the need to mmap your shared data but
> instead can keep everything purely in memory.
> 
> Unfortunately, I am not at full speed with memfds. Is my understanding correct that
> if the last user of such a file descriptor closes it, the corresponding memory is
> freed? Accordingly, memfd cannot be used to keep data in memory while no program is
> currently using it, can it? To be able to do this you need again some representation

I have a name for application-allocated kernel resources that persist
without a process holding a reference to them or a node in the
filesystem: a bug. See: sysvipc.

Rich
