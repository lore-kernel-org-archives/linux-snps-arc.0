Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D9C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Nov 2021 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9W0lrLsx8sxn17LjCF5ibf52VDuXzTWB2h+iFtkr2Q=; b=Ls9c5UoxJXtuCJ
	DIDCpp152WAroNbVGky+kT3LZCy/biCnoBdEYNEkwf50KFy4MGMT7xN82CEFNq0vLtAWSUiGZ78ey
	OD2ZiY4A3HoC45qyYxuiCgJGCYvsOgTM3wgKu4dRSF9nM4U8bco7taA+HbZpbBauoya27irqK3PH7
	Vmb2kEu6xdtsN3UEHcYutyddE9mmw3L7ZftQmsuwzUne0Yy8oOZDYm9W/FwDH4GoCjShGgCzK0ckM
	+cxB6moesueZsdx7A9t619ipUTozJ4UjTHFEQhkbjLoahDdw3aRMjD6W6uv6VKP8SvUsYoPI0xuR5
	eo9fQsZ13Ab6AtPY3IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrjbw-001Qs7-UV; Mon, 29 Nov 2021 16:34:36 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrjbp-001Qny-60; Mon, 29 Nov 2021 16:34:33 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2rXL58g0z9h;
 Mon, 29 Nov 2021 17:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638203665; bh=qlu3mL+FOvVS9aPE/gZoS7KdAdQ/avBctxZ8QxqT38I=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=GV8Md+4wLJhNSJZqrJvdjyVU0DlzlhbpPkGnTNqVApkG+uUQ6A+MoaqEQT9dgrjXq
 q+escBY9SwJTtDVYNHqesyY22ZcfBKeLVi2I4yINeaBpICc3EsCTOMz8/JkEhkxKwH
 5jlUqEb0yuAf8eVUX8cWy9bi6RovdDbzWpM+g8ZdNeFAwiFdkLHHM+FUiQ+x0Dv37t
 bEpCos1VGSJffWt42H8cWp9GNUDKdAgiFLCcBLScmau30GyMgUFylkw6qvpMGUFype
 xiTzGA2klsrhcAXTQoeGJ7H6y00R/3ukWQ3tN7aMIYo31vE1Ni41oAjMZVdXQclWDE
 FhYcDpXStxEZw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 16:34:07 +0000
From: =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
CC: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Alexey Klimov <aklimov@redhat.com>,
 linux-alpha@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Andi Kleen <ak@linux.intel.com>,
 Tejun Heo <tj@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
 Andy Lutomirski <luto@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Mel Gorman <mgorman@suse.de>,
 Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 David Laight <David.Laight@aculab.com>, Sunil Goutham <sgoutham@marvell.com>, 
 David Airlie <airlied@linux.ie>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 bcm-kernel-feedback-list@broadcom.com, Christoph Lameter <cl@linux.com>,
 linux-crypto@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>,
 linux-snps-arc@lists.infradead.org, Geetha sowjanya <gakula@marvell.com>,
 Mark Rutland <mark.rutland@arm.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roy Pledge <Roy.Pledge@nxp.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Jens Axboe <axboe@fb.com>,
 Jason Wessel <jason.wessel@windriver.com>, Jakub Kicinski <kuba@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ingo Molnar <mingo@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Ian Rogers <irogers@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sagi Grimberg <sagi@grimberg.me>, Sudeep Holla <sudeep.holla@arm.com>,
 Kalle Valo <kvalo@codeaurora.org>, Tariq Toukan <tariqt@nvidia.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Olsa <jolsa@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 Solomon Peachy <pizza@shaftnet.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, kvm@vger.kernel.org, 
 Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Subbaraya Sundeep <sbhatta@marvell.com>, linux-csky@vger.kernel.org,
 Marcin Wojtas <mw@semihalf.com>, linux-mips@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-s390@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
User-Agent: K-9 Mail for Android
In-Reply-To: <20211129063839.GA338729@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl> <20211129063839.GA338729@lapt>
Message-ID: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_083429_423338_8E60C43F 
X-CRM114-Status: GOOD (  23.22  )
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

RG5pYSAyOSBsaXN0b3BhZGEgMjAyMSAwNjozODozOSBVVEMsIFl1cnkgTm9yb3YgPHl1cnkubm9y
b3ZAZ21haWwuY29tPiBuYXBpc2HFgi9hOgo+T24gU3VuLCBOb3YgMjgsIDIwMjEgYXQgMDc6MDM6
NDFQTSArMDEwMCwgbWlycS10ZXN0QHJlcmUucW1xbS5wbCB3cm90ZToKPj4gT24gU2F0LCBOb3Yg
MjcsIDIwMjEgYXQgMDc6NTY6NTVQTSAtMDgwMCwgWXVyeSBOb3JvdiB3cm90ZToKPj4gPiBJbiBt
YW55IGNhc2VzIHBlb3BsZSB1c2UgYml0bWFwX3dlaWdodCgpLWJhc2VkIGZ1bmN0aW9ucyBsaWtl
IHRoaXM6Cj4+ID4gCj4+ID4gCWlmIChudW1fcHJlc2VudF9jcHVzKCkgPiAxKQo+PiA+IAkJZG9f
c29tZXRoaW5nKCk7Cj4+ID4gCj4+ID4gVGhpcyBtYXkgdGFrZSBjb25zaWRlcmFibGUgYW1vdW50
IG9mIHRpbWUgb24gbWFueS1jcHVzIG1hY2hpbmVzIGJlY2F1c2UKPj4gPiBudW1fcHJlc2VudF9j
cHVzKCkgd2lsbCB0cmF2ZXJzZSBldmVyeSB3b3JkIG9mIHVuZGVybHlpbmcgY3B1bWFzawo+PiA+
IHVuY29uZGl0aW9uYWxseS4KPj4gPiAKPj4gPiBXZSBjYW4gc2lnbmlmaWNhbnRseSBpbXByb3Zl
IG9uIGl0IGZvciBtYW55IHJlYWwgY2FzZXMgaWYgc3RvcCB0cmF2ZXJzaW5nCj4+ID4gdGhlIG1h
c2sgYXMgc29vbiBhcyB3ZSBjb3VudCBwcmVzZW50IGNwdXMgdG8gYW55IG51bWJlciBncmVhdGVy
IHRoYW4gMToKPj4gPiAKPj4gPiAJaWYgKG51bV9wcmVzZW50X2NwdXNfZ3QoMSkpCj4+ID4gCQlk
b19zb21ldGhpbmcoKTsKPj4gPiAKPj4gPiBUbyBpbXBsZW1lbnQgdGhpcyBpZGVhLCB0aGUgc2Vy
aWVzIGFkZHMgYml0bWFwX3dlaWdodF97ZXEsZ3QsbGV9Cj4+ID4gZnVuY3Rpb25zIHRvZ2V0aGVy
IHdpdGggY29ycmVzcG9uZGluZyB3cmFwcGVycyBpbiBjcHVtYXNrIGFuZCBub2RlbWFzay4KPj4g
Cj4+IEhhdmluZyBzbGVwdCBvbiBpdCBJIGhhdmUgbW9yZSBzdHJ1Y3R1cmVkIHRob3VnaHRzOgo+
PiAKPj4gRmlyc3QsIEkgbGlrZSBzdWJzdGl0dXRpbmcgYml0bWFwX2VtcHR5L2Z1bGwgd2hlcmUg
cG9zc2libGUgLSBJIHRoaW5rCj4+IHRoZSBjaGFuZ2Ugc3RhbmRzIG9uIGl0cyBvd24sIHNvIGNv
dWxkIGJlIHNwbGl0IGFuZCBzZW50IGFzIGlzLgo+Cj5PaywgSSBjYW4gZG8gaXQuCj4KPj4gSSBk
b24ndCBsaWtlIHRoZSBwcm9wb3NlZCBBUEkgdmVyeSBtdWNoLiBPbmUgcHJvYmxlbSBpcyB0aGF0
IGl0IGhpZGVzCj4+IHRoZSBjb21wYXJpc29uIG9wZXJhdG9yIGFuZCBtYWtlcyBjYWxsIHNpdGVz
IGxlc3MgcmVhZGFibGU6Cj4+IAo+PiAJYml0bWFwX3dlaWdodCguLi4pID4gTgo+PiAKPj4gYmVj
b21lczoKPj4gCj4+IAliaXRtYXBfd2VpZ2h0X2d0KC4uLiwgTikKPj4gCj4+IGFuZDoKPj4gCWJp
dG1hcF93ZWlnaHQoLi4uKSA8PSBOCj4+IAo+PiBiZWNvbWVzOgo+PiAKPj4gCWJpdG1hcF93ZWln
aHRfbHQoLi4uLCBOKzEpCj4+IG9yOgo+PiAJIWJpdG1hcF93ZWlnaHRfZ3QoLi4uLCBOKQo+PiAK
Pj4gSSdkIHJhdGhlciBzZWUgc29tZXRoaW5nIHJlc2VtYmxpbmcgbWVtY21wKCkgQVBJIHRoYXQn
cyBrbm93biBlbm91Z2gKPj4gdG8gYmUgZWFzaWVyIHRvIGdyYXNwLiBGb3IgYWJvdmUgZXhhbXBs
ZXM6Cj4+IAo+PiAJYml0bWFwX3dlaWdodF9jbXAoLi4uLCBOKSA+IDAKPj4gCWJpdG1hcF93ZWln
aHRfY21wKC4uLiwgTikgPD0gMAo+PiAJLi4uCj4KPmJpdG1hcF93ZWlnaHRfY21wKCkgY2Fubm90
IGJlIGVmZmljaWVudC4gQ29uc2lkZXIgdGhpcyBleGFtcGxlOgo+Cj5iaXRtYXBfd2VpZ2h0X2x0
KDEwMDAgMDAwMCAwMDAwIDAwMDAsIDEpID09IGZhbHNlCj4gICAgICAgICAgICAgICAgIF4KPiAg
ICAgICAgICAgICAgICAgc3RvcCBoZXJlCj4KPmJpdG1hcF93ZWlnaHRfY21wKDEwMDAgMDAwMCAw
MDAwIDAwMDAsIDEpID09IDAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0b3AgaGVyZQo+Cj5JIGFncmVlIHRoYXQg
J19ndCcgaXMgbGVzcyB2ZXJib3NlIHRoYW4gJz4nLCBidXQgdGhlIGFkdmFudGFnZSBvZiAKPidf
Z3QnIG92ZXIgJz4nIGlzIHByb3BvcnRpb25hbCB0byBsZW5ndGggb2YgYml0bWFwLCBhbmQgaXQg
bWVhbnMKPnRoYXQgdGhpcyBBUEkgc2hvdWxkIGV4aXN0LgoKVGhhbmsgeW91IGZvciB0aGUgZXhh
bXBsZS4gSW5kZWVkLCBmb3IgbGVzcy10aGFuIHRvIGJlIGVmZmljaWVudCBoZXJlIHlvdSB3b3Vs
ZCBuZWVkIHRvIHJlcGxhY2UKIGJpdG1hcF93ZWlnaHRfY21wKC4uLiwgTikgPCAwCndpdGgKIGJp
dG1hcF93ZWlnaHRfY21wKC4uLiwgTi0xKSA8PSAwCgpJdCB3b3VsZCBzdGlsbCBiZSBtb3JlIHJl
YWRhYmxlLCBJIHRoaW5rLgoKQmVzdCBSZWdhcmRzCk1pY2hhxYIgTWlyb3PFgmF3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
