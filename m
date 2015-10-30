From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 30 Oct 2015 14:28:39 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446215318.4394.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Nicolas,

On Thu, 2015-10-29@21:26 -0400, Nicolas Pitre wrote:
> On Wed, 28 Oct 2015, Nicolas Pitre wrote:
> 
> > On Thu, 29 Oct 2015, Alexey Brodkin wrote:
> > 
> > > Fortunately we already have much better __div64_32() for 32-bit ARM.
> > > There in case of division by constant preprocessor calculates so-called
> > > "magic number" which is later used in multiplications instead of divisions.
> > 
> > It's not magic, it is science.  :-)
> > 
> > > It's really nice and very optimal but obviously works only for ARM
> > > because ARM assembly is involved.
> > > 
> > > Now why don't we extend the same approach to all other 32-bit arches
> > > with multiplication part implemented in pure C. With good compiler
> > > resulting assembly will be quite close to manually written assembly.
> 
> Well... not as close at least on ARM.  Maybe 2x to 3x more costly than 
> the one with assembly.  Still better than 100x or so without this 
> optimization.

Indeed even having that function 25 times faster instead of 100 times is
already quite an achievement. For example that will already cure my iperf
performance degradation: I'll see do_div() taking < 1% instead of > 10% now.

My test source was:
--------------------->8------------------------
int myfunc(u64 data)
{
	return do_div(data, 1000);
}
--------------------->8------------------------

Now take a look at disassembly that I'm getting:
--------------------->8------------------------
0000062c <myfunc>:
 62c:	19 28 86 0f 4f 8d 3b df 	mpydu      r6,r0,0x8d4fdf3b
 634:	00 26 86 8f 4f 8d 3b df 	add.f      r6,r6,0x8d4fdf3b
 63c:	02 27 87 0f ed 7c 69 91 	sub        r7,r7,0x7ced9169
 644:	c0 27 65 00             	add.c      r7,r7,1
 648:	85 0e c4 71 12 83 97 6e 	brlo       0x83126e97,r7,6cc <myfunc+0xa0>

 650:	75 0f 80 0f 12 83 97 6e 	breq       r7,0x83126e97,6c4 <myfunc+0x98>

 658:	0d 70                   	mov_s      r8,0
 65a:	2d 71                   	mov_s      r9,1
 65c:	19 29 8a 0f 4f 8d 3b df 	mpydu      r10,r1,0x8d4fdf3b
 664:	00 27 84 82             	add.f      r4,r7,r10
 668:	ac 70                   	mov_s      r5,0
 66a:	19 28 86 0f 12 83 97 6e 	mpydu      r6,r0,0x83126e97
 672:	01 25 c5 02             	adc        r5,r5,r11
 676:	00 24 04 82             	add.f      r4,r4,r8
 67a:	00 25 45 02             	add        r5,r5,r9
 67e:	c0 25 65 00             	add.c      r5,r5,1
 682:	00 26 06 81             	add.f      r6,r6,r4
 686:	01 27 47 01             	adc        r7,r7,r5
 68a:	51 0f 44 01             	brlo       r7,r5,6d8 <myfunc+0xac>

 68e:	49 0d c0 01             	breq       r5,r7,6d4 <myfunc+0xa8>

 692:	8c 70                   	mov_s      r4,0
 694:	ac 70                   	mov_s      r5,0
 696:	e0 42                   	mov_s      r2,r7
 698:	19 29 86 0f 12 83 97 6e 	mpydu      r6,r1,0x83126e97
 6a0:	00 22 82 81             	add.f      r2,r2,r6
 6a4:	6c 70                   	mov_s      r3,0
 6a6:	01 23 c3 01             	adc        r3,r3,r7
 6aa:	00 22 02 81             	add.f      r2,r2,r4
 6ae:	a0 73                   	add_s      r3,r3,r5
 6b0:	c0 23 65 00             	add.c      r3,r3,1
 6b4:	29 ba                   	lsr_s      r2,r2,9
 6b6:	17 bb                   	asl_s      r3,r3,23
 6b8:	65 7a                   	or_s       r2,r2,r3
 6ba:	9a 22 0f 0a             	mpy        r2,r2,0x3e8
 6be:	e0 7f                   	j_s.d      [blink]
 6c0:	42 78                   	sub_s      r0,r0,r2
 6c2:	e0 78                   	nop_s      
 6c4:	95 0e 85 f1 4f 8d 3a df 	brhs.nt    0x8d4fdf3a,r6,658 <myfunc+0x2c>

 6cc:	0d 70                   	mov_s      r8,0
 6ce:	91 07 ef ff             	b.d        65c <myfunc+0x30>

 6d2:	2d 70                   	mov_s      r9,0
 6d4:	bf 0e 05 81             	brhs.nt    r6,r4,692 <myfunc+0x66>

 6d8:	8c 70                   	mov_s      r4,0
 6da:	bf 07 ef ff             	b.d        696 <myfunc+0x6a>

 6de:	ac 71                   	mov_s      r5,1
--------------------->8------------------------

What you see here is pretty straight-forward conversion to assembly of "run-time calculations".
Things to note:
 [1] Only 5 multiplications are used. That's because we have 32x32 multiplication unit
     that returns 64-bit result in register pair.

 [2] Indeed lots of moves and additions happen here.

So my conclusion would be:
 [1] Proposed implementation makes perfect sense because already speeds-up do_div()
     significantly.

 [2] Ability to substitute "run-time calculations" on per-arch basis would be awsome
     because with few lines of assembly another 2-4 times of improvement could be
     achieved.

-Alexey
