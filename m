From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 26 Sep 2016 12:38:19 +0000
Subject: modules still have .debug_* (was Re: [PATCH 0/3] ARC unwinder
 switch to .eh_frame)
In-Reply-To: <CAE2F3rBjKsEGpbUMhGLthx-Ue=LQCqEPtbB20bG2P=D2nbwYsw@mail.gmail.com>
References: <1474321773-18166-1-git-send-email-vgupta@synopsys.com>
 <CAE2F3rA0FrrNiHe6W6DSqYmpTyTiVD3h-wpGtW7rJ07RJLqqgw@mail.gmail.com>
 <caee47ec-eb68-59ee-50dc-ee02c4d78b7d@synopsys.com>
 <CAE2F3rBR872+M=mm7Qa5cccrtmOOp5cyZKSWjc4ytOG717jxKQ@mail.gmail.com>
 <1474627107.2562.19.camel@synopsys.com>
 <CAE2F3rBjKsEGpbUMhGLthx-Ue=LQCqEPtbB20bG2P=D2nbwYsw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474893488.4184.14.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Fri, 2016-09-23@18:04 -0700, Daniel Mentz wrote:
> On Fri, Sep 23, 2016 at 3:38 AM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
> > 
> > On Thu, 2016-09-22@15:37 -0700, Daniel Mentz wrote:
> > > 
> > > Sorry, that was a misunderstanding. Buildroot routinely runs the strip
> > > command on .ko files before installing them on the target. I was only
> > > looking at the .ko files *after* running the strip command. No, the
> > > interim patch was not in my tree.
> > 
> > Well are you sure buildroot really touches modules in Linux kernel build folder?
> > Buildroot just runs a simple "make" command in "output/build/linux-x.y".
> 
> Sorry, that was phrased badly. Buildroot does not touch the modules in
> the Linux kernel build folder. Modules are stripped in the target
> directory as you described.

So every is as expected now for you or there're still thing you don't like?

-Alexey
