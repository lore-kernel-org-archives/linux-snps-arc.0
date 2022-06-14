Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE53C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsXwS9mNjZkpPIvoxU2PjiX5nXMqqxazlx7xqAKcsjY=; b=Q7XPIiohM3pmn0
	R5hUOdCx2Yu6oFuctWlq1NF5oy8stBkMP+DCBOpqJi49jZ8gto/j6+fRRboRO41D6w+HmhJREUrED
	0J3E5n2EOzNvPxWlddMAuA1PoIcJtBXJR4sroCzToWwhvF2Y7GrCZI9Fj4OY5v6SC143uWm200YCj
	kOoWsH6mTD+7Za3bXNf0Mabsyt1Ge3P83oth14kWJ+RWA6YUskyRuUlOl95iFMhy67yiNK7HnUcf3
	B5WOzJAPrvtMneJk8OTcKShH1Kv5JveiMsvJJoVHkmy3V3CJd4E0c0xvDUKY/XTgyHVXhWSvoF/Xe
	pQADnn8r5mfZ9dNkULgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19eH-00APSX-LZ; Tue, 14 Jun 2022 16:44:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19eF-00APQJ-FQ; Tue, 14 Jun 2022 16:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lGPDnVOvpW5cJYkNK5aiO+HQt8YloxSeZZcAt0L3T+0=; b=DAyjnelx4YBZDCDKjW1vABnwD6
	bfuQInSMcO0k1N9c43zulrHrt0FEspCLqBV7dzVlaMMaDm/0d8h+E1vx/Mn16eV+mdIA5cFTuH3pJ
	ZPctIYIGAc1IQVFMkXT59RectB0+FvezRUN6pXOBo7jPhyxeW7DquiSvQAiutE+ZX5GvtHgbHFHRx
	6HNiF1zBAiNoXSUuUybOLrpKXxYLhLp7SkKzRQuOg8AsSzW4GjX7X7PIc8C1Yqe4MS+PoRyI4eENc
	TnTVXl8b+mj78ByEoizyUwQl4K8tWC0/1bV8h78+HtzLeArX034mK97ekOVdMcZW15wljxz2QwCm7
	eJasXJFA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19e7-007uTz-7Y; Tue, 14 Jun 2022 16:44:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BBDAE3002BE;
	Tue, 14 Jun 2022 18:44:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1F7228B3F630; Tue, 14 Jun 2022 18:44:02 +0200 (CEST)
Date: Tue, 14 Jun 2022 18:44:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Cc: "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"bsegall@google.com" <bsegall@google.com>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"agross@kernel.org" <agross@kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"mattst88@gmail.com" <mattst88@gmail.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sammy@sammy.net" <sammy@sammy.net>,
	"pmladek@suse.com" <pmladek@suse.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"acme@kernel.org" <acme@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"rth@twiddle.net" <rth@twiddle.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"paulus@samba.org" <paulus@samba.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"kernel@xen0n.name" <kernel@xen0n.name>,
	"quic_neeraju@quicinc.com" <quic_neeraju@quicinc.com>,
	linux-s390 <linux-s390@vger.kernel.org>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"deller@gmx.de" <deller@gmx.de>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"shorne@gmail.com" <shorne@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"chris@zankel.net" <chris@zankel.net>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>,
	"bristot@redhat.com" <bristot@redhat.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"joel@joelfernandes.org" <joel@joelfernandes.org>,
	Will Deacon <will@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"khilman@kernel.org" <khilman@kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	Pv-drivers <Pv-drivers@vmware.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	Mel Gorman <mgorman@suse.de>,
	"jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>,
	"vgupta@kernel.org" <vgupta@kernel.org>,
	"josh@joshtriplett.org" <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"bcain@quicinc.com" <bcain@quicinc.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"dalias@libc.org" <dalias@libc.org>,
	"tony@atomide.com" <tony@atomide.com>,
	"bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"jonas@southpole.se" <jonas@southpole.se>,
	"yury.norov@gmail.com" <yury.norov@gmail.com>,
	"richard@nod.at" <richard@nod.at>, X86 ML <x86@kernel.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Ingo Molnar <mingo@redhat.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"paulmck@kernel.org" <paulmck@kernel.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"stefan.kristiansson@saunalahti.fi" <stefan.kristiansson@saunalahti.fi>,
	"openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"namhyung@kernel.org" <namhyung@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"monstr@monstr.eu" <monstr@monstr.eu>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Pv-drivers] [PATCH 29/36] cpuidle,	xenpv: Make more
 PARAVIRT_XXL noinstr clean
Message-ID: <Yqi60lnN6MQpysBw@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.759631860@infradead.org>
 <510b9b68-7d53-7d4d-5a05-37fbd199eb4b@csail.mit.edu>
 <BAE566A0-AEA3-493E-8AC5-912C795BF1DE@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAE566A0-AEA3-493E-8AC5-912C795BF1DE@vmware.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTMsIDIwMjIgYXQgMDc6MjM6MTNQTSArMDAwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiBPbiBKdW4gMTMsIDIwMjIsIGF0IDExOjQ4IEFNLCBTcml2YXRzYSBTLiBCaGF0IDxzcml2
YXRzYUBjc2FpbC5taXQuZWR1PiB3cm90ZToKPiAKPiA+IOKaoCBFeHRlcm5hbCBFbWFpbAo+ID4g
Cj4gPiBPbiA2LzgvMjIgNDoyNyBQTSwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPj4gdm1saW51
eC5vOiB3YXJuaW5nOiBvYmp0b29sOiBhY3BpX2lkbGVfZW50ZXJfczJpZGxlKzB4ZGU6IGNhbGwg
dG8gd2JpbnZkKCkgbGVhdmVzIC5ub2luc3RyLnRleHQgc2VjdGlvbgo+ID4+IHZtbGludXgubzog
d2FybmluZzogb2JqdG9vbDogZGVmYXVsdF9pZGxlKzB4NDogY2FsbCB0byBhcmNoX3NhZmVfaGFs
dCgpIGxlYXZlcyAubm9pbnN0ci50ZXh0IHNlY3Rpb24KPiA+PiB2bWxpbnV4Lm86IHdhcm5pbmc6
IG9ianRvb2w6IHhlbl9zYWZlX2hhbHQrMHhhOiBjYWxsIHRvIEhZUEVSVklTT1Jfc2NoZWRfb3Au
Y29uc3Rwcm9wLjAoKSBsZWF2ZXMgLm5vaW5zdHIudGV4dCBzZWN0aW9uCj4gPj4gCj4gPj4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgWmlqbHN0cmEgKEludGVsKSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBTcml2YXRzYSBTLiBCaGF0IChWTXdhcmUpIDxzcml2YXRz
YUBjc2FpbC5taXQuZWR1Pgo+ID4gCj4gPj4gCj4gPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCB3Ymlu
dmQodm9pZCkKPiA+PiArZXh0ZXJuIG5vaW5zdHIgdm9pZCBwdl9uYXRpdmVfd2JpbnZkKHZvaWQp
Owo+ID4+ICsKPiA+PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHdiaW52ZCh2b2lkKQo+
ID4+IHsKPiA+PiAgICAgIFBWT1BfQUxUX1ZDQUxMMChjcHUud2JpbnZkLCAid2JpbnZkIiwgQUxU
X05PVChYODZfRkVBVFVSRV9YRU5QVikpOwo+ID4+IH0KPiAKPiBJIGd1ZXNzIGl0IGlzIHlldCBh
bm90aGVyIGluc3RhbmNlIG9mIHdyb25nIGFjY291bnRpbmcgb2YgR0NDIGZvcgo+IHRoZSBhc3Nl
bWJseSBibG9ja3PigJkgd2VpZ2h0LiBJIGd1ZXNzIGl0IGlzIG5vdCBhIHNvbHV0aW9uIGZvciBv
bGRlcgo+IEdDQ3MsIGJ1dCBwcmVzdW1hYmx5IF9fX19QVk9QX0FMVF9DQUxMKCkgYW5kIGZyaWVu
ZHMgc2hvdWxkIGhhdmUKPiB1c2VkIGFzbV9pbmxpbmUgb3Igc29tZSBuZXcg4oCcYXNtX3ZvbGF0
aWxlX2lubGluZeKAnSB2YXJpYW50LgoKUGFydGlhbGx5LCBzb21lIG9mIHRoZSAqU0FOIG9wdGlv
bnMgYWxzbyBnZW5lcmF0ZSBhIG1ldHJpYyB0b24gb2YKbm9uc2Vuc2Ugd2hlbiBlbmFibGVkIGFu
ZCBza2V3IHRoZSBjb21waWxlcnMgdG93YXJkcyBub3QgaW5saW5pbmcKdGhpbmdzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
