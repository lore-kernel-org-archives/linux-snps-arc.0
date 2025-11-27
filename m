Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57209CFD2F6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Nov 2025 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jo5iin0caJAv3vTQvqoy3LNvmUzjq/N37CtcqLh3s80=; b=0pxORd5dBnUbmt
	mxijzIahJvMBEkQ1CbAS8C0FZRSW5dKTQ63A9XgTDW9lsBauFdcDT5DN5nyUTbFfVmVw/6JIN/qCW
	BTxrZpuHUfOm6Ob5UNWJU4DVfaS9cC/NmzzqrqSt9gKBj/00OgThvQTnxp19OqZTJ+jQScvCkpDHt
	JTzyrWmjiHqGSUkZWX+PU8zqZRUDb9kQ3pARgPf+odhP4GqspQ1p6iw2hde+s499cKSOvbq5ypX+a
	swPTyRVxnWIiMObMWclwPp4NA5H6Wm7Z1IW8zfxy6kY/W3H2sAkQ+MTfl+tcVlHWFntcnbI9RMsw0
	z9tZ+ToqdbO3UJBwDyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY36-0000000GG5i-036e;
	Thu, 27 Nov 2025 09:12:24 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY33-0000000GG5A-1jKV
	for linux-snps-arc@lists.infradead.org;
	Thu, 27 Nov 2025 09:12:22 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 6A0A6A8DBA; Thu, 27 Nov 2025 10:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1764234688; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=pJ+waC60w0KmXcsJOhBNN8xzG6CxnXhssW4d0KvBN6Ud02tjlzAqbiVz99hOXmnBv
	 3WQbqmRJKMdJ0iJdm2qftuJkQDSXM1DhhyQihHZmmWkrCg2UMNtYaQORXLTsEecC+O
	 qIugkIOX1mj+s/JPKaf8agwna4MdnYAPq9KuIVE/n6uPXxtzCFH6FcTkSKNTB0Y1Wo
	 odh/TfIIP9TUeR+HD+kTxRFWj+36YDkM8zFwnAzkLlCxvQfPhJbXhQpEgqwXAJQoLL
	 H27zy74CEcNrjzhuE9E4Z6vNtu0QzNsuY6AWeui6Ef8fU9n6sV6apefQZc/3bzhRJj
	 pcek2OojvtHxQ==
Received: by mail.vexro.pl for <linux-snps-arc@lists.infradead.org>; Thu, 27 Nov 2025 09:10:34 GMT
Message-ID: <20251127084500-0.1.ou.4mrj2.0.kly02g868l@vexro.pl>
Date: Thu, 27 Nov 2025 09:10:34 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011221_722159_71EBE958 
X-CRM114-Status: UNSURE (   1.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
