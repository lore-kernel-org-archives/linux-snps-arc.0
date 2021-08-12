Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F10BC4320E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 18:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D66C2610A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 18:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D66C2610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5LTFNeZewzpTf5Mee7ueukEliCP7CP0jmNi6E0k25I=; b=4LYGKx81nCL/9QlRKzx0oh4nN1
	bsStRsA4lwIeCC0S89/koTEY6zzOfYdxp0tlH02yzqUtS7mszBN9R/JQEDQJpe831h5E5KVBaa3Qc
	V8MH2PMpFsUPpNclU8ahBnHIclOUa4ILPh3YwkrMV96K/maFU1WWfgw3elhFekZlgoVDSnHkQny/s
	MuNy+MXi97x40oQG0dgN409v1NzNbQuAwg7VuC8qFs7IuJ1iVhufvAJY0uuu04wGYyL03vKk8ZVxs
	PixkAC34BEexlBMkdSPoey2/hRbQsOfYcwctAtERQpuoc2PsTm0hss5t4nEY5qHvLLd97GDTMRFpf
	no+yIoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEFu2-00AwY4-8j; Thu, 12 Aug 2021 18:58:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEFto-00AwVb-4Q; Thu, 12 Aug 2021 18:57:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 362056103A;
 Thu, 12 Aug 2021 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628794671;
 bh=9lyFwGGuyLf5GdDUz/aKvERlOFF1uWuGiPBbUIAEKfE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VwLU2IBE7pm2CpqhWrWcs09zHfDgGQQ+XwYJ0x4NJ+OYptETg8cUHpeJuXviSEb8m
 hZwv3aN1LfVIwHZVS+UQ7mB1srMgVxwRZcSfRTFv67A2WL07AvZbrPj/Jz8MICDjiz
 tSsLyZBkRPIi4PEfw72QWFlCzfTyNhyHc6hoJdLtBX/ALr48Ij7oskYZxfFb8gVUAz
 MdoO56PMOMA1qSMNTQQWl/YJOfRCSFiinLi5nd/tFripDrfTPOSzz5IN+8rkyBTJL5
 ClZ1UH9RZQQUjhvz/MyHpPFG2IOOryYDriDcsJsaN4YgRfyjgsTyLvyz3NzaOYphUa
 cYgcKsD4gQWUw==
Subject: Re: [PATCH -next] trap: Cleanup trap_init()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <palmerdabbelt@google.com>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <b49eed44-0837-906c-8779-4fffb5609653@kernel.org>
Date: Thu, 12 Aug 2021 11:57:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_115752_237725_049F6BA1 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOC8xMi8yMSA1OjM2IEFNLCBLZWZlbmcgV2FuZyB3cm90ZToKPiBUaGVyZSBhcmUgc29tZSBl
bXB0eSB0cmFwX2luaXQoKSBpbiBkaWZmZXJlbnQgQVJDSHMsIGludHJvZHVjZQo+IGEgbmV3IHdl
YWsgdHJhcF9pbml0KCkgZnVuY3Rpb24gdG8gY2xlYW51cCB0aGVtLgo+Cj4gQ2M6IFZpbmVldCBH
dXB0YTx2Z3VwdGFAa2VybmVsLm9yZz4KPiBDYzogUnVzc2VsbCBLaW5nPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4KPiBDYzogWW9zaGlub3JpIFNhdG88eXNhdG9AdXNlcnMuc291cmNlZm9yZ2UuanA+
Cj4gQ2M6IExleSBGb29uIFRhbjxsZXkuZm9vbi50YW5AaW50ZWwuY29tPgo+IENjOiBKb25hcyBC
b25uPGpvbmFzQHNvdXRocG9sZS5zZT4KPiBDYzogU3RlZmFuIEtyaXN0aWFuc3NvbjxzdGVmYW4u
a3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFN0YWZmb3JkIEhvcm5lPHNob3JuZUBn
bWFpbC5jb20+Cj4gQ2M6IEphbWVzIEUuSi4gQm90dG9tbGV5PEphbWVzLkJvdHRvbWxleUBIYW5z
ZW5QYXJ0bmVyc2hpcC5jb20+Cj4gQ2M6IEhlbGdlIERlbGxlcjxkZWxsZXJAZ214LmRlPgo+IENj
OiBNaWNoYWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzogQmVuamFtaW4gSGVy
cmVuc2NobWlkdDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gQ2M6IFBhdWwgTWFja2VycmFz
PHBhdWx1c0BzYW1iYS5vcmc+Cj4gQ2M6IFBhdWwgV2FsbXNsZXk8cGFsbWVyZGFiYmVsdEBnb29n
bGUuY29tPgo+IENjOiBKZWZmIERpa2U8amRpa2VAYWRkdG9pdC5jb20+Cj4gQ2M6IFJpY2hhcmQg
V2VpbmJlcmdlcjxyaWNoYXJkQG5vZC5hdD4KPiBDYzogQW50b24gSXZhbm92PGFudG9uLml2YW5v
dkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b248YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZzx3YW5na2VmZW5nLndhbmdA
aHVhd2VpLmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJjL2tlcm5lbC90cmFwcy5jICAgICAgfCA1IC0t
LS0tCgpBY2tlZC1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdEBrZXJuZWwub3JnPsKgICNhcmNoL2Fy
YwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
