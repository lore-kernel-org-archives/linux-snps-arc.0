Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C308BC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Dec 2021 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbbui+yJ25W0pmzdF905SOsvbW4Nf0NyR/GIz9WLKL8=; b=iNdgi3U7obeM9B
	DqiTrQNVZNgTBFZC+pSb01LaWtkH69m/Ko058cte2nlyS1DoHlqnAG8gFyhNasCbpg2yuZBn009kn
	EBsOx0iHfjSHqmqfaLhGR+UGgvADDiX5NcAgcNqj6GcPj/quDT+QOLdrmJ9cTE/pwGVreT5cb9xP1
	4AgsTLmJedGQ6tg1jEVuBaw6tT6ZHJ0h793nqXeXTNL0gdQCNZIBgji1G4yPBLLzPwem4M+wMtEM3
	vtV0NYqpmldIadtSgMQofg0FX5z47xXTNwt8hC2OW69/wYcnlvCXINh7A9Ye2wSZ1Z6fK+zaV9UGO
	Tvj/riNr8gPvZek2j/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msa0p-00ASJb-MF; Thu, 02 Dec 2021 00:31:47 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msa0m-00ASIo-JW; Thu, 02 Dec 2021 00:31:46 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id u16so23421365qvk.4;
 Wed, 01 Dec 2021 16:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UYmHlVbMSQbQAn62a50WlYWlw5WYikEw/HKO8MU8o20=;
 b=d9ufFBZIjBeCnfJhxkhOJHR4U6gA3sYY5/+OartHrmtyqhNuwpEH+tfc93YA7tEDao
 yOKDodcNFRle3eMMLCg2FH/Tcgr7cW593yntXLl1utZLUJtVShRNQEOc9NvEo4hEL1rm
 L2l6bxTExKPSRmbnMRKqIcZhoOpd63W1ZKagDrFCRbYIcYvSgN+CxBxrwTxGRSsHeVKf
 UXZK5TS9EbCKBOwmJzZ51FgzKmkah4fU/bnP1hNtNTskTK6qjluwzPEk7uWUTAkKCdZ1
 XxzA5TtEBQPg9PU9R4bStLW9Ne4zdJoIM+RpRwYI7AmQcqEYlTEIoOnEsCuvtTzXmNFj
 00eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UYmHlVbMSQbQAn62a50WlYWlw5WYikEw/HKO8MU8o20=;
 b=pd1ChqY40LJyrsgGgWQ1FhhbbhYRMG756kDQL09DNwl/xsyk36pl/y58qq58zYSo07
 tcr5Cj58zWlwHlATAYtKQ8ElSFkMx/dDno+WGHBJ3nlgRKYlLJLFCn4U5MmI/jAJo7xm
 U0Uh+nH8V6z6RiM62KXlrtfHAtEluzhbfJzWLo6FO/ufezK8z3p0vcg3rfpjrjHw2SBw
 qJriepRTLx7glWOXCih/m+Mfivn3b/LuKOnKNn1q67PUKszcOO5S5x6e6cA/ephJK9o7
 b/vAD4U36VMSaRDqycpYuK8OjOcxIE3M1O9VJ3i/p5SCRRIaeyjrz9p7V99TRtWbxpe9
 /dKg==
X-Gm-Message-State: AOAM533jSBnyQ3FMnVhZgwCzZgV79eQS5SdJx4AynqJ7hKlRVyFWUZJi
 cV3KGsUKR02MEvVcbH7lYhs=
X-Google-Smtp-Source: ABdhPJwpuPpSi7n83vlL+jLX5fyPRTIJyAHbiKfUe+xvjm76YV/xzPPNg/iMW1GhI6PSi3iKc0YBEA==
X-Received: by 2002:a05:6214:ccc:: with SMTP id 12mr9930154qvx.8.1638405102640; 
 Wed, 01 Dec 2021 16:31:42 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id l1sm690890qkp.125.2021.12.01.16.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 16:31:42 -0800 (PST)
Date: Wed, 1 Dec 2021 16:31:40 -0800
From: Yury Norov <yury.norov@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-alpha@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Andi Kleen <ak@linux.intel.com>,
 Tejun Heo <tj@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
 Andy Lutomirski <luto@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mel Gorman <mgorman@suse.de>, Christoph Hellwig <hch@lst.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 David Laight <David.Laight@aculab.com>,
 Sunil Goutham <sgoutham@marvell.com>, David Airlie <airlied@linux.ie>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 bcm-kernel-feedback-list@broadcom.com,
 Christoph Lameter <cl@linux.com>, linux-crypto@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, linux-snps-arc@lists.infradead.org,
 Geetha sowjanya <gakula@marvell.com>, Mark Rutland <mark.rutland@arm.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dennis Zhou <dennis@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Jens Axboe <axboe@fb.com>, Jason Wessel <jason.wessel@windriver.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ingo Molnar <mingo@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Ian Rogers <irogers@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sagi Grimberg <sagi@grimberg.me>, Sudeep Holla <sudeep.holla@arm.com>,
 Kalle Valo <kvalo@codeaurora.org>, Tariq Toukan <tariqt@nvidia.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
 Vineet Gupta <vgupta@kernel.org>, Solomon Peachy <pizza@shaftnet.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Subbaraya Sundeep <sbhatta@marvell.com>, linux-csky@vger.kernel.org,
 Marcin Wojtas <mw@semihalf.com>, linux-mips@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-s390@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211202003140.GA430494@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl> <20211129063839.GA338729@lapt>
 <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_163144_696773_B4EC5D85 
X-CRM114-Status: GOOD (  34.88  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMDQ6MzQ6MDdQTSArMDAwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gRG5pYSAyOSBsaXN0b3BhZGEgMjAyMSAwNjozODozOSBVVEMsIFl1cnkgTm9y
b3YgPHl1cnkubm9yb3ZAZ21haWwuY29tPiBuYXBpc2HFgi9hOgo+ID5PbiBTdW4sIE5vdiAyOCwg
MjAyMSBhdCAwNzowMzo0MVBNICswMTAwLCBtaXJxLXRlc3RAcmVyZS5xbXFtLnBsIHdyb3RlOgo+
ID4+IE9uIFNhdCwgTm92IDI3LCAyMDIxIGF0IDA3OjU2OjU1UE0gLTA4MDAsIFl1cnkgTm9yb3Yg
d3JvdGU6Cj4gPj4gPiBJbiBtYW55IGNhc2VzIHBlb3BsZSB1c2UgYml0bWFwX3dlaWdodCgpLWJh
c2VkIGZ1bmN0aW9ucyBsaWtlIHRoaXM6Cj4gPj4gPiAKPiA+PiA+IAlpZiAobnVtX3ByZXNlbnRf
Y3B1cygpID4gMSkKPiA+PiA+IAkJZG9fc29tZXRoaW5nKCk7Cj4gPj4gPiAKPiA+PiA+IFRoaXMg
bWF5IHRha2UgY29uc2lkZXJhYmxlIGFtb3VudCBvZiB0aW1lIG9uIG1hbnktY3B1cyBtYWNoaW5l
cyBiZWNhdXNlCj4gPj4gPiBudW1fcHJlc2VudF9jcHVzKCkgd2lsbCB0cmF2ZXJzZSBldmVyeSB3
b3JkIG9mIHVuZGVybHlpbmcgY3B1bWFzawo+ID4+ID4gdW5jb25kaXRpb25hbGx5Lgo+ID4+ID4g
Cj4gPj4gPiBXZSBjYW4gc2lnbmlmaWNhbnRseSBpbXByb3ZlIG9uIGl0IGZvciBtYW55IHJlYWwg
Y2FzZXMgaWYgc3RvcCB0cmF2ZXJzaW5nCj4gPj4gPiB0aGUgbWFzayBhcyBzb29uIGFzIHdlIGNv
dW50IHByZXNlbnQgY3B1cyB0byBhbnkgbnVtYmVyIGdyZWF0ZXIgdGhhbiAxOgo+ID4+ID4gCj4g
Pj4gPiAJaWYgKG51bV9wcmVzZW50X2NwdXNfZ3QoMSkpCj4gPj4gPiAJCWRvX3NvbWV0aGluZygp
Owo+ID4+ID4gCj4gPj4gPiBUbyBpbXBsZW1lbnQgdGhpcyBpZGVhLCB0aGUgc2VyaWVzIGFkZHMg
Yml0bWFwX3dlaWdodF97ZXEsZ3QsbGV9Cj4gPj4gPiBmdW5jdGlvbnMgdG9nZXRoZXIgd2l0aCBj
b3JyZXNwb25kaW5nIHdyYXBwZXJzIGluIGNwdW1hc2sgYW5kIG5vZGVtYXNrLgo+ID4+IAo+ID4+
IEhhdmluZyBzbGVwdCBvbiBpdCBJIGhhdmUgbW9yZSBzdHJ1Y3R1cmVkIHRob3VnaHRzOgo+ID4+
IAo+ID4+IEZpcnN0LCBJIGxpa2Ugc3Vic3RpdHV0aW5nIGJpdG1hcF9lbXB0eS9mdWxsIHdoZXJl
IHBvc3NpYmxlIC0gSSB0aGluawo+ID4+IHRoZSBjaGFuZ2Ugc3RhbmRzIG9uIGl0cyBvd24sIHNv
IGNvdWxkIGJlIHNwbGl0IGFuZCBzZW50IGFzIGlzLgo+ID4KPiA+T2ssIEkgY2FuIGRvIGl0Lgo+
ID4KPiA+PiBJIGRvbid0IGxpa2UgdGhlIHByb3Bvc2VkIEFQSSB2ZXJ5IG11Y2guIE9uZSBwcm9i
bGVtIGlzIHRoYXQgaXQgaGlkZXMKPiA+PiB0aGUgY29tcGFyaXNvbiBvcGVyYXRvciBhbmQgbWFr
ZXMgY2FsbCBzaXRlcyBsZXNzIHJlYWRhYmxlOgo+ID4+IAo+ID4+IAliaXRtYXBfd2VpZ2h0KC4u
LikgPiBOCj4gPj4gCj4gPj4gYmVjb21lczoKPiA+PiAKPiA+PiAJYml0bWFwX3dlaWdodF9ndCgu
Li4sIE4pCj4gPj4gCj4gPj4gYW5kOgo+ID4+IAliaXRtYXBfd2VpZ2h0KC4uLikgPD0gTgo+ID4+
IAo+ID4+IGJlY29tZXM6Cj4gPj4gCj4gPj4gCWJpdG1hcF93ZWlnaHRfbHQoLi4uLCBOKzEpCj4g
Pj4gb3I6Cj4gPj4gCSFiaXRtYXBfd2VpZ2h0X2d0KC4uLiwgTikKPiA+PiAKPiA+PiBJJ2QgcmF0
aGVyIHNlZSBzb21ldGhpbmcgcmVzZW1ibGluZyBtZW1jbXAoKSBBUEkgdGhhdCdzIGtub3duIGVu
b3VnaAo+ID4+IHRvIGJlIGVhc2llciB0byBncmFzcC4gRm9yIGFib3ZlIGV4YW1wbGVzOgo+ID4+
IAo+ID4+IAliaXRtYXBfd2VpZ2h0X2NtcCguLi4sIE4pID4gMAo+ID4+IAliaXRtYXBfd2VpZ2h0
X2NtcCguLi4sIE4pIDw9IDAKPiA+PiAJLi4uCj4gPgo+ID5iaXRtYXBfd2VpZ2h0X2NtcCgpIGNh
bm5vdCBiZSBlZmZpY2llbnQuIENvbnNpZGVyIHRoaXMgZXhhbXBsZToKPiA+Cj4gPmJpdG1hcF93
ZWlnaHRfbHQoMTAwMCAwMDAwIDAwMDAgMDAwMCwgMSkgPT0gZmFsc2UKPiA+ICAgICAgICAgICAg
ICAgICBeCj4gPiAgICAgICAgICAgICAgICAgc3RvcCBoZXJlCj4gPgo+ID5iaXRtYXBfd2VpZ2h0
X2NtcCgxMDAwIDAwMDAgMDAwMCAwMDAwLCAxKSA9PSAwCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RvcCBo
ZXJlCj4gPgo+ID5JIGFncmVlIHRoYXQgJ19ndCcgaXMgbGVzcyB2ZXJib3NlIHRoYW4gJz4nLCBi
dXQgdGhlIGFkdmFudGFnZSBvZiAKPiA+J19ndCcgb3ZlciAnPicgaXMgcHJvcG9ydGlvbmFsIHRv
IGxlbmd0aCBvZiBiaXRtYXAsIGFuZCBpdCBtZWFucwo+ID50aGF0IHRoaXMgQVBJIHNob3VsZCBl
eGlzdC4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBleGFtcGxlLiBJbmRlZWQsIGZvciBsZXNzLXRo
YW4gdG8gYmUgZWZmaWNpZW50IGhlcmUgeW91IHdvdWxkIG5lZWQgdG8gcmVwbGFjZQo+ICBiaXRt
YXBfd2VpZ2h0X2NtcCguLi4sIE4pIDwgMAo+IHdpdGgKPiAgYml0bWFwX3dlaWdodF9jbXAoLi4u
LCBOLTEpIDw9IDAKCkluZGVlZCwgdGhhbmtzIGZvciBwb2ludGluZyB0byBpdC4KIAo+IEl0IHdv
dWxkIHN0aWxsIGJlIG1vcmUgcmVhZGFibGUsIEkgdGhpbmsuCgpUbyBiZSBob25lc3QsIEknbSBu
b3Qgc3VyZSB0aGF0CiAgICAgICAgYml0bWFwX3dlaWdodF9jbXAoLi4uLCBOLTEpIDw9IDAKd291
bGQgYmUgYW4gb2J2aW91cyByZXBsYWNlbWVudCBmb3IgdGhlIG9yaWdpbmFsCiAgICAgICAgYml0
bWFwX3dlaWdodCguLi4pIDwgTgpjb21wYXJpbmcgdG8gCiAgICAgICAgYml0bWFwX3dlaWdodF9s
dCguLi4sIE4pCgpJIHRoaW5rIHRoZSBiZXN0IHRoaW5nIEkgY2FuIGRvIGlzIHRvIGFkZCBiaXRt
YXBfd2VpZ2h0X2NtcCgpIGFzCnlvdSBzdWdnZXN0ZWQsIGFuZCB0dXJuIGx0IGFuZCBvdGhlcnMg
dG8gYmUgd3JhcHBlcnMgb24gaXQuIFRoaXMKd2lsbCBsZXQgcGVvcGxlIGNob29zZSBhIGJldHRl
ciBmdW5jdGlvbiBpbiBlYWNoIGNhc2UuCgpJIGFsc28gdGhpbmsgdGhhdCBmb3IgdjIgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGRyb3AgdGhlIGNvbnZlcnNpb24KZm9yIHNob3J0IGJpdG1hcHMsIGV4
Y2VwdCBmb3Igc3dpdGNoaW5nIHRvIGJpdG1hcF9lbXB0eSgpLCBiZWNhdXNlCmluIHRoYXQgY2Fz
ZSByZWFkYWJpbGl0eSB3aW5zIG92ZXIgcGVyZm9ybWFuY2U7IGlmIG5vIG9iamVjdGlvbnMuIAoK
VGhhbmtzLApZdXJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
