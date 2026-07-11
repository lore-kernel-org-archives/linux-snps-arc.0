Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E36C44501
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Jul 2026 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOGD62oTIWR9ZcFo5BZcMnWkQXLeivZixiZHVTuNxvU=; b=uBop8ULiwbSyI+
	iaVfKb+MxjR6dy8qeDBCUzOVeWgmgUBzUC7Eo+RjlquRy8QIBFemSvBiP5EUqCnsMuQoq4hgyYbVI
	mxca4B4Tf0z8SHNwm5haAcL+4QxlZESUheYWH2ngXX29wAGcbgffXbthzh8OAqPpySqERRASqRHrO
	S0/cQGsY1zfeBF+mGr+r6tG6W6yGMyYu48eDW4RvWgON/purZ3Pv+AdegF6DtqfjvuSzjsamJm6bl
	KVi+9e/cgQkEBU9pBzPdv1c3xCb7+5YScy2c1hAosIlFAJWEgFHcDXlZJea0As68gQjkgV+SHKykj
	cCwasbXGS+0cdCGZM0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieO3-00000006s6f-04uf;
	Sat, 11 Jul 2026 20:33:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieO0-00000006s6J-36rB;
	Sat, 11 Jul 2026 20:33:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB80242ADA;
	Sat, 11 Jul 2026 20:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74601F000E9;
	Sat, 11 Jul 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783801999;
	bh=vf0x/sVLTVCL/PCgyuZ8JagPvunPhYIkJoaxGkdlgsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=f6nPQIDWb921zxEmTCJayCTDOfYZdi0+7zYrhf0upuiSWI9j5AZ2jA4rhsOs29HYT
	 WC65M3P5E0Ndczi1cDcuiv7hGhsQJHbzIeCfUAQhsb3BAmdz9sIRmrV3HJM1BFxfHh
	 Aux4CNd9IAvECdD+RCjW44j4iuQp1Him2INHy0sHP/oX42qlbB/BPDPlYwuwpyf330
	 fm02VsUCvmZUjjgJlLWziVrF+imgTjTEQzqm6tpMlL+GLiRFtJSumKDpDKIPCbMwb6
	 NV1PwwP0Vo7BFl96u+JrYXmWPko75piPEvZ0MdoWxo/dPZ46b1HjcordjvvVp5/9ci
	 U6Hw/ms11EcEw==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
In-Reply-To: <alDQ7isUKJFl8Va4@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org> <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13> <alDQ7isUKJFl8Va4@kunlun.suse.cz>
Date: Sat, 11 Jul 2026 22:33:16 +0200
Message-ID: <87a4rxqnar.ffs@fw13>
MIME-Version: 1.0
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

TWljaGFsIQoKT24gRnJpLCBKdWwgMTAgMjAyNiBhdCAxMzowMSwgTWljaGFsIFN1Y2jDoW5layB3
cm90ZToKPiBPbiBXZWQsIEp1bCAwOCwgMjAyNiBhdCAxMDozNDozOFBNICswMjAwLCBUaG9tYXMg
R2xlaXhuZXIgd3JvdGU6Cj4+IGRvZXMgbm90IG1ha2UgIzIgbWFnaWNhbGx5IGdvIGF3YXkuIEl0
J3Mgc3RpbGwgdGhlIHNhbWUgcHJvYmxlbSB3aGV0aGVyCj4+IHlvdSBsaWtlIGl0IG9yIG5vdC4K
Pgo+IEhvd2V2ZXIsIHJlYWRpbmcgdGhlIHN5c2NhbGwgbnVtYmVyIGZyb20gcHRfcmVncyBvbmx5
IGFmdGVyCj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSBleGl0cyBkb2VzLgoKVGhhdCBk
b2VzIG5vdCBzb2x2ZSBhbnl0aGluZyBhdCBhbGwuCgpUQkgsIHlvdXIgY29tbXVuaWNhdGlvbiBz
dHlsZSBpcyBhbm5veWluZyBhcyBoZWxsLiBZb3UgZmFpbCB0byBwcm92aWRlCmFueSB1c2VmdWwg
YXJndW1lbnRzIGFuZCBleHBsYW5hdGlvbnMgZGVzcGl0ZSBtZSBnaXZpbmcgeW91IGEgcHJvcGVy
CmFuYWx5c2lzLiBBbmQgSSdtIGFic29sdXRlbHkgdGlyZWQgb2YgdGhpcy4KClNvIGxldCBtZSB0
cnkgYWdhaW4gZm9yIF9PTkVfIGxhc3QgdGltZSB0byBleHBsYWluIHlvdSB3aHkgeW91ciBwcGMv
czM5MAp3b3JsZCB2aWV3IGlzIGJyb2tlbiBhbmQgbGV0J3MgbG9vayBhdCB0aGUgY3VycmVudCBj
b2RlIChpcnJlbGV2YW50CnBvcnRpb25zIG9taXR0ZWQpLgoKc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBsb25nIHN5c2NhbGxfdHJhY2VfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVk
IGxvbmcgd29yaykKewoJaWYgKHdvcmsgJiBTWVNDQUxMX1dPUktfU1lTQ0FMTF9VU0VSX0RJU1BB
VENIKSB7CiMxCQlpZiAoc3lzY2FsbF91c2VyX2Rpc3BhdGNoKHJlZ3MpKQoJCQlyZXR1cm4gLTFM
OwoJfQogICAgICAgIAoJaWYgKHdvcmsgJiAoU1lTQ0FMTF9XT1JLX1NZU0NBTExfVFJBQ0UgfCBT
WVNDQUxMX1dPUktfU1lTQ0FMTF9FTVUpKSB7CiMyCQlyZXQgPSBhcmNoX3B0cmFjZV9yZXBvcnRf
c3lzY2FsbF9lbnRyeShyZWdzKTsKCQlpZiAocmV0IHx8ICh3b3JrICYgU1lTQ0FMTF9XT1JLX1NZ
U0NBTExfRU1VKSkKCQkJcmV0dXJuIC0xTDsKCX0KCgkvKiBEbyBzZWNjb21wIGFmdGVyIHB0cmFj
ZSwgdG8gY2F0Y2ggYW55IHRyYWNlciBjaGFuZ2VzLiAqLwoJaWYgKHdvcmsgJiBTWVNDQUxMX1dP
UktfU0VDQ09NUCkgewojMwkJcmV0ID0gX19zZWN1cmVfY29tcHV0aW5nKCk7CgkJaWYgKHJldCA9
PSAtMUwpCgkJCXJldHVybiByZXQ7Cgl9CgoJLyogRWl0aGVyIG9mIHRoZSBhYm92ZSBtaWdodCBo
YXZlIGNoYW5nZWQgdGhlIHN5c2NhbGwgbnVtYmVyICovCiM0CXN5c2NhbGwgPSBzeXNjYWxsX2dl
dF9ucihjdXJyZW50LCByZWdzKTsKCglpZiAodW5saWtlbHkod29yayAmIFNZU0NBTExfV09SS19T
WVNDQUxMX1RSQUNFUE9JTlQpKQojNQkJc3lzY2FsbCA9IHRyYWNlX3N5c2NhbGxfZW50ZXIocmVn
cywgc3lzY2FsbCk7CgogICAgICAgIHJldHVybiBzeXNjYWxsOwp9CgojMSkgVGhlIHVzZXIgZGlz
cGF0Y2ggbWVjaGFuaXNtIGRvZXMgbm90IG1vZGlmeSB0aGUgc3lzY2FsbCByZXR1cm4KICAgIHZh
bHVlLCBidXQgaXQgY2FuIHJvbGxiYWNrIHRoZSBzeXNjYWxsIGFuZCB0ZWxsIHRoZSBjYWxsIHNp
dGUgdG8KICAgIHNraXAgdGhlIGludm9jYXRpb24uCgogICAgVGhlIG1lY2hhbmlzbSB1c2VkIGlu
IHVwc3RyZWFtIHRvZGF5IGlzIHRvIHJldHVybiAtMUwgYXMgdGhlIHN5c2NhbGwKICAgIG51bWJl
ciB3aGljaCBtYWtlcyB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGVudHJ5IGNvZGUgc2tpcCB0
aGUKICAgIHN5c2NhbGwgYW5kIHJlZnJhaW4gZnJvbSB0b3VjaGluZyB0aGUgcmV0dXJuIHZhbHVl
LgoKIzIpIHB0cmFjZQoKICAgIHB0cmFjZSBjYW4gcG9rZSB3aGF0ZXZlciBpdCB3YW50cyBpbnRv
IHRoZSBzeXNjYWxsIG51bWJlciBzdG9yYWdlCiAgICB2aWEgcHRyYWNlX3NldF9zeXNjYWxsX2lu
Zm9fZW50cnkoKSAtPiBzeXNjYWxsX3NldF9ucigpCgogICAgSXQgZG9lcyBub3Qgc2V0IHRoZSBy
ZXR1cm4gY29kZS4KCiAgICBJdCBkb2VzIG5vdCBhYm9ydCB0aGUgc3lzY2FsbCB3aGVuIHRoZSBw
b2tlZCBzeXNjYWxsIG51bWJlciBpcyAtMUwuCgogICAgSXQgb25seSBhYm9ydHMgd2hlbiBhIGZh
dGFsIHNpZ25hbCBpcyBwZW5kaW5nLgoKIzMpIHNlY2NvbXAKCiAgICBzZWNjb21wIHJlYWRzIHRo
ZSBzeXNjYWxsIG51bWJlciwgd2hpY2ggbWlnaHQgaGF2ZSBiZWVuIG1vZGlmaWVkIGJ5CiAgICBw
dHJhY2UgYW5kIGFjdHMgdXBvbiBpdC4KCiAgICBJdCBjYW4gcmV3cml0ZSB0aGUgc3lzY2FsbCBu
dW1iZXIgZXZlbiBpZiBpdCBpcyAtMSB0byBiZWdpbiB3aXRoLgoKICAgIEl0IGNhbiByZXdyaXRl
IHRoZSByZXR1cm4gY29kZSBpZiBpdCBkZWNpZGVzIHRvIHJlZnVzZSB0aGUgc3lzY2FsbAogICAg
dG8gYmUgZXhlY3V0ZWQuCgogICAgSWYgaXQgcmVmdXNlcyB0aGUgc3lzY2FsbCB0byBiZSBleGVj
dXRlZCBpdCByZXR1cm5zIC0xTC4KCiM0KSBSZXJlYWRpbmcgdGhlIHN5c2NhbGwgbnVtYmVyIGFm
dGVyIHB0cmFjZS9zZWNjb21wCgogICAgVGhhdCdzIHJlcXVpcmVkIHRvIGdpdmUgdGhlIGV2ZW50
dWFsbHkgbW9kaWZpZWQgbnVtYmVyIHRvIHRoZQogICAgdHJhY2VyLgoKICAgIE9idmlvdXNseSB0
aGUgdHJhY2VyIGNvdWxkIGRvIHRoYXQgb24gaXQncyBvd24sIGJ1dCB3aXRoIHRoZSBjdXJyZW50
CiAgICBpbXBsZW1lbnRhdGlvbiBpdCBleHBlY3RzIHRoZSBldmVudHVhbGx5IG1vZGlmaWVkIHN5
c2NhbGwgbnVtYmVyCgogICAgQ2hhbmdpbmcgdGhhdCB0byBtYWtlIHRoZSB0cmFjZXIgZG8gaXQs
IGlzIHBvc3NpYmxlIGJ1dCBkb2VzIG5vdAogICAgY2hhbmdlIGFueSBvZiB0aGUgYWN0dWFsIGV4
cGVjdGF0aW9ucy4gVGhhdCdzIGp1c3QgY29zbWV0aWMgd2Fua2VyeS4KCiM1KSB0cmFjaW5nCgog
ICAgdHJhY2luZyBjYW4gaGF2ZSBhIHByb2JlIG9yIGJwZiBhdHRhY2hlZCwgd2hpY2ggaW4gdHVy
biBjYW4KCiAgICAgIC0gcmV3cml0ZSB0aGUgc3lzY2FsbCBudW1iZXIKCiAgICAgIC0gc2V0IHRo
ZSByZXR1cm4gY29kZSBpbiBjYXNlIHRoYXQgaXQgc2V0cyB0aGUgc3lzY2FsbCBudW1iZXIgdG8K
ICAgICAgICAtMUwKCiAgICAgICAgSXQgY2FuIGV2ZW4gc2V0IGl0IGluIGNhc2UgaXQgc2V0cyBp
dCB0byBzb21lIG90aGVyIHZhbHVlLCBidXQKICAgICAgICB0aGUgYXJjaGl0ZWN0dXJlIGNvZGUg
aGFzIHRvIGJlIHJlc2lsZW50IGFnYWluc3QgdGhhdCBubyBtYXR0ZXIKICAgICAgICB3aGF0LgoK
ICAgICAgLSBpZiBpdCBkb2VzIG5vdCBzZXQgdGhlIHJldHVybiBjb2RlIHdoZW4gaXQgc2V0cyB0
aGUgc3lzY2FsbAogICAgICAgIG51bWJlciB0byAtMUwgdGhlbiBpdCBoYXMgYSBoaXN0b3JpY2Fs
IGV4cGVjdGF0aW9uIHRoYXQgdGhlCiAgICAgICAgc3lzY2FsbCByZXR1cm5zIC1FTk9TWVMKCiAg
ICAgICAgVGhhdCdzIGhvdyBpdCBpcyBhbmQgeW91IGNhbiBhcmd1ZSBpbiBjaXJjbGVzIGFuZCBp
dCdzIG5vdCBnb2luZwogICAgICAgIGF3YXkgdW5sZXNzIHlvdSBoYXZlIGEgZ3JlYXQgYXJndW1l
bnQgd2h5IHlvdSBjYW4gYnJlYWsgZXhpc3RpbmcKICAgICAgICB1c2VyIHNwYWNlIHByb2Jlcy9i
cGYgc2NyaXB0cy4KClNvIG5vdyBwbGVhc2UgcHJvdmlkZSBpbiBjb2hlcmVudCBzZW50ZW5jZXMg
dGhlIGFyZ3VtZW50IHdoeSB0aGlzIHNvbHZlcwphbnl0aGluZzoKCj4gSG93ZXZlciwgcmVhZGlu
ZyB0aGUgc3lzY2FsbCBudW1iZXIgZnJvbSBwdF9yZWdzIG9ubHkgYWZ0ZXIKPiBzeXNjYWxsX2Vu
dGVyX2Zyb21fdXNlcl9tb2RlIGV4aXRzIGRvZXMuCgpJZiB5b3UgY2FuLCB3aGljaCBJIGRvdWJ0
LCB0aGVuIHBsZWFzZSBzZW5kIGEgcGF0Y2ggW3Nlcmllc10gYWdhaW5zdDoKCiAgIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4L2RldmVsLmdpdCBlbnRy
eS9yZXdvcmsKCndpdGggcHJvcGVyIGNoYW5nZSBsb2dzIGV4cGxhaW5pbmcgdGhlIHN1cGVyaW91
ciBzb2x1dGlvbi4KCklmIG5vdCwgcGxlYXNlIHNwYXJlIHVzIHRoZSBuZXh0IHNldCBvZiBpbmNv
aGVyZW50ICJJIHdhbid0IGEgcG9ueSIKbWFpbHMuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
