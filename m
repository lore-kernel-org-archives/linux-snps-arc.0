Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7575C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 09:11:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE4960BD3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 09:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE4960BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z/waQqgRpAgOSNz3ogKYCE0GgLM/AbotaBvjrNXmB/s=; b=gWmLCd4HmrbItLjujo3b0+JIG
	guJfxu+4sGvPN2lPMmikww4AFB/VOcJepb4rYxPY4iSA9zxcEurFLh9DL22z7GgbsLa+WXbRy4/X7
	4v0t5qRDdP8zF83/JFLD8mTZJMSZw01AedYv/xwymQyZdR71Gxq4OZMlUWdMVp0yUOiBDvqVyTWge
	aS9oEQ0z8P7e1ZBkFITZdgT1J13xp21MMR0A7qDSv0w7ZDac/P0+JLCa1UkuU0k83T6UjAgZy2xmu
	ImIiO12h4ifDkA2e4GzvQ4k+NdMc8D7xsVf9yJFHy5NVuax2bymqy3PQNq16ux7E6wKlNfEAsgoc8
	ldkcuQqOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWbYW-00C6Qh-Fr; Wed, 14 Apr 2021 09:11:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbY0-00C6Np-DS; Wed, 14 Apr 2021 09:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=MBQu58u912Wp3RAACzwxJA2dsjrUY72qr2psLRaB7ps=; b=MrATausYZYDJzBp1KfoNsEQOXL
 EFc6eklzbGHYkzgjyRB+wqFCPQqAFY7FDntVQTa2K2kHfVOzLOLmyEBj+UAijsQ1KsnSCfdGVtQHp
 5R928HDE3rHFH43GhR1HAIs6VUJOnpnJ4zv2wShRpJ0MMlLTlX7/ihs28ChxUTSsj5c/4Ey+sjGaD
 GASLtCSDTqadxEW8hUk1KBpudwrdhIw01ngadUSliumQKkQfGL1+BjVi/o91TudOIYYVO0v1fUukp
 FqMT2fhOcz7RuJF/5FSTCAAb0ctidSDPosJ2XF1T7MtG35D9fwxUrq/gg/8KN53MSdIHSEpGjFN99
 5IguMYjw==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbXw-007duz-7Y; Wed, 14 Apr 2021 09:10:55 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKxXQ05PXz9txRC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0zeBA9ZPccDQ; Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKxXP4rdvz9ttBY;
 Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE0B88B7BC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QZ2BMSlNARn7; Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 098558B7BA;
 Wed, 14 Apr 2021 11:10:44 +0200 (CEST)
Subject: Re: [PATCH] init: consolidate trap_init()
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-parisc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20210414165808.458a3d11@xhacker.debian>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
Date: Wed, 14 Apr 2021 11:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414165808.458a3d11@xhacker.debian>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_021052_601333_97575297 
X-CRM114-Status: GOOD (  18.31  )
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

CgpMZSAxNC8wNC8yMDIxIMOgIDEwOjU4LCBKaXNoZW5nIFpoYW5nIGEgw6ljcml0wqA6Cj4gTWFu
eSBhcmNoaXRlY3R1cmVzIGltcGxlbWVudCB0aGUgdHJhcF9pbml0KCkgYXMgTk9QLCBzaW5jZSB0
aGVyZSBpcwo+IG5vIHN1Y2ggZGVmYXVsdCBmb3IgdHJhcF9pbml0KCksIHRoaXMgZW1wdHkgc3R1
YiBpcyBkdXBsaWNhdGVkIGFtb25nCj4gdGhlc2UgYXJjaGl0ZWN0dXJlcy4gUHJvdmlkZSBhIGdl
bmVyaWMgYnV0IHdlYWsgTk9QIGltcGxlbWVudGF0aW9uCj4gdG8gZHJvcCB0aGUgZW1wdHkgc3R1
YnMgb2YgdHJhcF9pbml0KCkgaW4gdGhlc2UgYXJjaGl0ZWN0dXJlcy4KCllvdSBkZWZpbmUgdGhl
IHdlYWsgZnVuY3Rpb24gaW4gdGhlIF9faW5pdCBzZWN0aW9uLgoKTW9zdCBidXQgbm90IGFsbCBh
cmNoaXRlY3R1cmVzIGhhZCBpdCBpbiBfX2luaXQgc2VjdGlvbi4KCkFuZCB0aGUgcmVtYWluaW5n
IG9uZXMgbWF5IG5vdCBiZSBkZWZpbmVkIGluIF9faW5pdCBzZWN0aW9uLiBGb3IgaW5zdGFuY2Ug
bG9vayBhdCB0aGUgb25lIGluIGFscGhhIAphcmNoaXRlY3R1cmUuCgpIYXZlIHlvdSBjaGVja2Vk
IHRoYXQgaXQgaXMgbm90IGEgcHJvYmxlbSA/IEl0IHdvdWxkIGJlIGdvb2QgdG8gc2F5IHNvbWV0
aGluZyBhYm91dCBpdCBpbiB0aGUgY29tbWl0IApkZXNjcmlwdGlvbi4KCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KPiAtLS0K
PiAgIGFyY2gvYXJjL2tlcm5lbC90cmFwcy5jICAgICAgfCAgNSAtLS0tLQo+ICAgYXJjaC9hcm0v
a2VybmVsL3RyYXBzLmMgICAgICB8ICA1IC0tLS0tCj4gICBhcmNoL2g4MzAwL2tlcm5lbC90cmFw
cy5jICAgIHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9oZXhhZ29uL2tlcm5lbC90cmFwcy5j
ICB8ICA0IC0tLS0KPiAgIGFyY2gvbmRzMzIva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+
ICAgYXJjaC9uaW9zMi9rZXJuZWwvdHJhcHMuYyAgICB8ICA1IC0tLS0tCj4gICBhcmNoL29wZW5y
aXNjL2tlcm5lbC90cmFwcy5jIHwgIDUgLS0tLS0KPiAgIGFyY2gvcGFyaXNjL2tlcm5lbC90cmFw
cy5jICAgfCAgNCAtLS0tCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3RyYXBzLmMgIHwgIDUgLS0t
LS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+ICAgYXJjaC91
bS9rZXJuZWwvdHJhcC5jICAgICAgICB8ICA0IC0tLS0KPiAgIGluaXQvbWFpbi5jICAgICAgICAg
ICAgICAgICAgfCAgMiArKwo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2
MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5pdC9tYWluLmMgYi9pbml0L21haW4u
Ywo+IGluZGV4IDUzYjI3ODg0NWI4OC4uNGJkYmUyOTI4NTMwIDEwMDY0NAo+IC0tLSBhL2luaXQv
bWFpbi5jCj4gKysrIGIvaW5pdC9tYWluLmMKPiBAQCAtNzkwLDYgKzc5MCw4IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBpbml0Y2FsbF9kZWJ1Z19lbmFibGUodm9pZCkKPiAgIH0KPiAgICNlbmRpZgo+
ICAgCj4gK3ZvaWQgX19pbml0IF9fd2VhayB0cmFwX2luaXQodm9pZCkgeyB9Cj4gKwoKSSB0aGlu
ayBpbiBhIEMgZmlsZSB3ZSBkb24ndCB0cnkgdG8gc2F2ZSBzcGFjZSBhcyBtdWNoIGFzIGluIGEg
aGVhZGVyIGZpbGUuCgpJIHdvdWxkIHByZWZlciBzb21ldGhpbmcgbGlrZToKCgp2b2lkIF9faW5p
dCBfX3dlYWsgdHJhcF9pbml0KHZvaWQpCnsKfQoKCj4gICAvKiBSZXBvcnQgbWVtb3J5IGF1dG8t
aW5pdGlhbGl6YXRpb24gc3RhdGVzIGZvciB0aGlzIGJvb3QuICovCj4gICBzdGF0aWMgdm9pZCBf
X2luaXQgcmVwb3J0X21lbWluaXQodm9pZCkKPiAgIHsKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
