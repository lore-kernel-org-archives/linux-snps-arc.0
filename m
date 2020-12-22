Return-Path: <SRS0=T7L2=F2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76566C43381
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Dec 2020 20:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033AE229C5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Dec 2020 20:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033AE229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HVJz05VW7YTTD3NkH41DV0kNP91bOr0jkM/mbXmqARw=; b=bIMIf3NN9YLAaC7KaDqyeYv3Z
	Jvh44LIMAWT4lO/biAi+Lg3ecPlIrE48Bw8eAuwFqLdc6M7rSDt0RV3k4taEIJKrpNrzoQxupDwLY
	balJ2y3KG1N7UWYYwpKLHH7WwB6O7F+S5QjQUnoKn1HvP/QIpZE7nTmim9AUW07towC62pJf82yk5
	EZLMRPIxEa6Jzxr8Z3BLI9R0cD2pGsNKOQrXOWgoYfdsAXXuWa50YzImlt7YY1uL0xuVTNrBjvqbE
	1pAYKDjzmrbJqrBS2cUeVOgQSCJF1LMlKS3X6HMVDKpDgpyr2xpmgdTQOK5eF3uoqQ4QteXr3SEx5
	OTO/PJD0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kro48-0005vx-TD; Tue, 22 Dec 2020 20:15:28 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kro46-0005vF-9t; Tue, 22 Dec 2020 20:15:27 +0000
Received: from [192.168.1.155] ([95.118.68.26]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5FtF-1jtguL3EaD-0118EC; Tue, 22 Dec 2020 21:14:24 +0100
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
Date: Tue, 22 Dec 2020 21:14:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:UpSPX5SjSxB2JTjoTNk4sWDtA2g9Ks1Ix8dKZhB/ESwn1jWfyhx
 EoQG8feaYKyQLnGwygV2naaePTeCvGl6q4M5FCoVvWDzd5IDw7I4++spAXF1Cn7hlWYDZ9i
 kl7Eptzr5sffhmk6uqoQvQuMaJH6WbEHZSp8VbRZESTCM8tqF2liTqVeSG60D5ct0JeRFXM
 C/vRJPf10ZNRyihx6OQ7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4rmsxPbYFfk=:r6XlGr1qgoUDdOPZvl+EZB
 Tvvn/+E+IBfJxp8NYxN6kmODEYBvHcxpBa91h8yz4H6rftNQGPPvhJG9K3iz7sa8U3axvH9gb
 k8MQxF8AkxpsOIqgXUvRf2/UkUWU0UyTVaNY4yxFyPXaJ5HZGvdBlHztqC0ROOQbfPfvuc9EL
 FxgUfcgonSSkeeYMjRiTB3zJbeFMtXOTHkBa2rvNba1MQtk+fNt8bwxkcg/16D1kNX6CaQa6R
 /HjaLu8M8eiwjXWLzppTMleqwd3hE1HiIRNtfJF9qFLMDQKH5ELRRUKQxUmk7wwJOm6jAqUoz
 DxOEn9gjBP8Krn67rCBumevzsK7LiZ8dtcUh+n3F3XTZoxMWvkNcvhbeCfAuF95ukrIWyQBXn
 H8gIR89lqyF1p5Egw7NhgnSoXyIbQAraihthZryjzaPuyq4jPkP8GrsbXJIV3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_151526_554073_2ED18614 
X-CRM114-Status: GOOD (  15.31  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMjIuMTIuMjAgMTk6NTQsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKCkhpLAoKPiBPbiBU
dWUsIERlYyAyMiwgMjAyMCBhdCA3OjQ2IFBNIEVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25z
dWx0Cj4gPGluZm9AbWV0dXgubmV0PiB3cm90ZToKPj4gTW92ZSB0aGUgcG1fcG93ZXJfb2ZmIGNh
bGxiYWNrIGludG8gb25lIGdsb2JhbCBwbGFjZSBhbmQgYWxzbyBhZGQgYW4KPj4gZnVuY3Rpb24g
Zm9yIGNvbmRpdGlvbmFsbHkgY2FsbGluZyBpdCAod2hlbiBub3QgTlVMTCksIGluIG9yZGVyIHRv
IHJlbW92ZQo+PiBjb2RlIGR1cGxpY2F0aW9uIGluIGFsbCBpbmRpdmlkdWFsIGFyY2hzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCA8aW5mb0Bt
ZXR1eC5uZXQ+Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+PiAtLS0gYS9hcmNoL2Fs
cGhhL2tlcm5lbC9wcm9jZXNzLmMKPj4gKysrIGIvYXJjaC9hbHBoYS9rZXJuZWwvcHJvY2Vzcy5j
Cj4+IEBAIC00MywxMiArNDMsNiBAQAo+PiAgI2luY2x1ZGUgInByb3RvLmgiCj4+ICAjaW5jbHVk
ZSAicGNpX2ltcGwuaCIKPj4KPj4gLS8qCj4+IC0gKiBQb3dlciBvZmYgZnVuY3Rpb24sIGlmIGFu
eQo+PiAtICovCj4+IC12b2lkICgqcG1fcG93ZXJfb2ZmKSh2b2lkKSA9IG1hY2hpbmVfcG93ZXJf
b2ZmOwo+IAo+IEFzc2lnbm1lbnRzIGxpa2UgdGhlc2UgYXJlIGxvc3QgaW4gdGhlIGNvbnZlcnNp
b24uCgpZZXMsIGJ1dCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSBldmVyIGNhbGxlZCBhbnl3YXlz
LiAoaW4gYXJjaC9hbHBoYSkKQW5kLCBCVFcsIGxldHRpbmcgaXQgcG9pbnQgdG8gbWFjaGluZV9w
b3dlcl9vZmYoKSBkb2Vzbid0IG1ha2UgbXVjaApzZW5zZSwgc2luY2UgaXQncyB0aGUgYXJjaCdz
IG1hY2hpbmVfcG93ZXJfb2ZmKCkgZnVuY3Rpb24sIHdobydyZQpjYWxsaW5nIHBtX3Bvd2VyX29m
ZigpLgoKQWN0dWFsbHksIHdlIGNvdWxkIHJlbW92ZSBwbV9wb3dlcl9vZmYgY29tcGxldGVseSBm
cm9tIGhlcmUsIGFzc3VtaW5nCm5vYm9keSB3b3VsZCAqYnVpbGQqIGFueSBkcml2ZXJzIHRoYXQg
cmVnaXN0ZXIgdGhlbXNlbHZlcyBpbnRvCnBtX3Bvd2VyX29mZi4KCklmIHlvdSBmZWVsIGJldHRl
ciB3aXRoIGl0LCBJIGNvdWxkIHBvc3QgYSBwYXRjaCB0aGF0IGp1c3QgcmVtb3ZlcwpwbV9wb3dl
cl9vZmYgZnJvbSBhcmNoL2FscGhhLgoKCi0tbXR4CgotLSAKLS0tCkhpbndlaXM6IHVudmVyc2No
bMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVuZCBtYW5pcHVsaWVy
dAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11bmlrYXRpb24gc2VuZGVuIFNp
ZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0tLQpFbnJpY28gV2VpZ2VsdCwg
bWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVl
cmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
