From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 13 Nov 2018 16:45:55 +0000
Subject: MMC: bonnie++ runs with errors after switching mmc to blk-mq
In-Reply-To: <CACRpkdYL3NTmQieC025W=Qh515U-+75dD_39vQkZYsvuLc8Vvw@mail.gmail.com>
References: <1541774198.20621.50.camel@synopsys.com>
 <CACRpkdYL3NTmQieC025W=Qh515U-+75dD_39vQkZYsvuLc8Vvw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1542127554.10282.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-11-13@09:09 +0100, Linus Walleij wrote:
> On Fri, Nov 9, 2018 at 3:36 PM Eugeniy Paltsev
> <eugeniy.paltsev@synopsys.com> wrote:
> 
> > I still can reproduce errors about hung task when I run bonnie++ benchmark on arc/hsdk board
> > (ARC HS38 CPU, Synopsys DW MMC controller).
> 
> Hm I didn't use bonnie++ but I used iozone excessively to verify
> Adrians patches, at times leaving it running for days without
> any problems. (Though not on these hardwares.)
> 
> > Error message
> > is like:
> > ----------------------------->8----------------------------
> > # mount /dev/mmcblk0p4 /mnt/mmcblk0p4
> > EXT4-fs (mmcblk0p4): mounted filesystem with
> > ordered data mode. Opts: (null)
> > # bonnie++ -u root -r 256 -s 512 -x 1  -d /mnt/mmcblk0p4
> > Using uid:0, gid:0.
> > Writing with putc()...done
> > Writing
> > intelligently...done
> > Rewriting...INFO: task bonnie++:187 blocked for more than 10 seconds.
> >       Not tainted 4.19.0 #2
> 
> I'm not sure hanging for more than 10 seconds is really a
> problem. eMMCs can sometimes become really slow
> when doing internal garbage collection. Are you sure
> this is not the case?

Actually I'm not an expert in eMMC stuff so it's 
difficult to me to talk about eMMCs internal garbage collection.

>  If you run it without the hang checks,
> will it still complete, or is this one of those benchmarks
> that just keep running until you interrupt it?

bonnie++ completes regardless of hung tasks detection enabling/disabling.

Nevertheless as I can see write speed differs significantly in
case of clean run and run with hung task notifications
(look at shrinked bonnie++ output bellow)

Moreover I launched bonnie++ on kernel build from commit c3d53d0da69d
[one commit behind 81196976ed94 (mmc: block: Add blk-mq support)]
and I don't see significant differs in write speed values between
multiple bonnie++ runs. (There is no hung task notifications as well)


Good case (ARM, CubieBoard2):
------Sequential Output------
-Per Chr-|--Block--|-Rewrite-
K/sec %CP|K/sec %CP|K/sec %CP
 5825  98|12996   7| 9873   5


Bad (with hung task notification) case (ARM, CubieBoard2):
------Sequential Output------
-Per Chr-|--Block--|-Rewrite-
K/sec %CP|K/sec %CP|K/sec %CP
 5630  95| 6275   3| 4723   2


> > (filemap_fdatawait_keep_errors) from
> > [<c02cc3d0>] (jbd2_journal_commit_transaction+0x9b8/0x167c)
> > [ 6402.570857] [<c02cc3d0>]
> > (jbd2_journal_commit_transaction) from [<c02d0478>] (kjournald2+0xe4/0x2c8)
> > [ 6402.580011] [<c02d0478>] (kjournald2) from [<c013ab04>]
> 
> This seems more like some excessive wait in the file system
> journal to me (OK I might be wrong). Which is also known
> to thrash the specific sectors where the journal is kept
> which may very well lead to a lot of garbage collection
> in the card. (OK I am half-guessing...)
> 
> What filesystem are you using on this eMMC?

I use ext4 in both of cases.

> If something exotic, could you just try ext4 as most
> embedded systems use and see what happens?
> 
> Yours,
> Linus Walleij
-- 
 Eugeniy Paltsev
