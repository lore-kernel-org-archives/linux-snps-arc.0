Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC38C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 23:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB19206CD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 23:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quzCGsL3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aHowjMX1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="peAfui2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB19206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YlysNZJksT9GQFBtQ+N1SmGXbKebcZjowNJ7n5TcFIc=; b=quzCGsL3HP/iOyCGyYSFgzBJV
	Oncf0cJ9+/frYW/+38VuDECdZd0u0p8VdzjBA9XvkdCCGV4/jy7I5WOEb/SZKJKky9okLmDgD8usC
	X4cWN2fe2z1MyPirDA+cYOLK2fKKOxUEbJMR2+jt3hOj5DtQUOrABaNUoTZa/Ic9ay7vxayMTn1ej
	/SFVfPv0UB4jnaaEgxfVO4L+/cPS689D5uN0vma932BnIeciIrAINcbiQyFx1yrzLjTiRzQzepOl5
	l6N1e/9ctAJw2qJdiF/DUgJ4icwXodAfXxnELMYKbyAgHiDH0PgEphXTeZuGa/BKmC481R+oE62MU
	Mq6cnATJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jswpM-0000iz-6n; Tue, 07 Jul 2020 23:16:40 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jswpK-0000iV-6m
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 23:16:39 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E0E8B402FB;
 Tue,  7 Jul 2020 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594163795; bh=lHnEu5wEaELcHHu4ik1I0vJFQPF2Jesi7KVagLsvUWA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aHowjMX1/7hLmJ0F5hmn+p+VNLi796oyr0hM6zgAVTNdzlhCL0xRQZtdsWeDveG80
 U9BlXWNpejQ3XRwIOpdyNQKdVuufXZcTCEbBQncVHLNSsjMAgIhawu312i1VPUenRU
 y8tb6Nusztvn5FS3PYZYhcuLhNrPZv+a2sVAVirSGKrbefZ63dvWLIIcgRzxGt5XDS
 IJ1UdNAgLimLVyx8QOROiB7Fv/UVqmzkU99ji3iTZXbBD8FIIcCs64frWJGWAYfqSG
 0oHFAYikGkrXiVyhvVBvENli6Y+O9ecX6LqXCWd1ALwIvaSRS2AS0GBFDP29ypkCTL
 VM5/tFWCjJ61Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 84D3DA006F;
 Tue,  7 Jul 2020 23:16:32 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id F2B82400CB;
 Tue,  7 Jul 2020 23:16:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="peAfui2Z";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cukcer3b0kEw/5yXaAYiBNKcn8AuI9ehRYF8LqgA3R5QLmzjB/WXg6+Ep+jIRS4VB915CiqyyaKeAdPJcc6qxVC58dGMBmb+EEzNwAZB94KqEDo3M/i7aw4/0S6JvARXkbNUOf5fLIqSZVU8otLeqLJIcods0f3jLi5Y7EDUglWWeeX6m2DEoXZCz154DC+vlO4J+MRAFalhydRdpcofp27yswiTLVM1XRB7IrRfx22E6yby7wqvrgrCtvRz43S638gloRYLIV8NgVxwCJR2yO6pgY6fc5kZQQX8JlC44V56RHEL70SSnW9z9+yWVEJ0CTtii/nRzS3cRWqRdFvL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHnEu5wEaELcHHu4ik1I0vJFQPF2Jesi7KVagLsvUWA=;
 b=PxET7LLVr+0zQzHXOY7EXS1LYswSPgeHMx85F6rWsFR7vG0Sk200nvLptyd/RxceOAaVLc42Clii/l8PAB5VQXUs8AJ0b6aHpwXYeVgUP+JcHbKrLdVEbibGlEHfXY20uA2zYPODlMz7sVccRh3MfrSY2U16AEmbxNp1psv/4qJqETzsT5sbceM9SaTvJDToB2jL2tGeS0SepF3eSQHVP7sU1G0+01mrYu+AUDq+Cz8/96xAofrX1l583OMiMxbJ63HXVsdTLCarG8CQvM0bsi/fZeFKTZz6kts8mUhUnP4iGZRXrrv/tWib34mp5Nr2HabFc9p722yaE5aUybOAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHnEu5wEaELcHHu4ik1I0vJFQPF2Jesi7KVagLsvUWA=;
 b=peAfui2ZiS7sUBAX1YvUTcAAAl5syLiBpPplYAyKR35Z7NfQ0O/PmeFdITwY7GEhqdDWSUkRiXRlBOudRVPCR5T9YmXEHkv2JmvPMq2tCvDyX+uiXc5lmXX6sJBx9ZGp9I+uoRvy7UdUeSslFDdeE5BX8BkkvOc9Ay8xtzKFTKI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3447.namprd12.prod.outlook.com (2603:10b6:a03:a9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Tue, 7 Jul
 2020 23:16:29 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 23:16:29 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWUbbDaTLzMWGcD0Of3DrN+Hn5Laj6jSGAgADKUoCAAS1/gIAAHM8AgAAG8oCAAB0nAA==
Date: Tue, 7 Jul 2020 23:16:29 +0000
Message-ID: <914e73fd-27dd-14b7-841c-66f9501adde3@synopsys.com>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
 <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
 <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
 <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
 <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <0e3bf658-10b4-0428-02f3-f2ae01c77ddf@synopsys.com>
 <alpine.DEB.2.21.2007072128060.16069@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2007072128060.16069@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: codesourcery.com; dkim=none (message not signed)
 header.d=none;codesourcery.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7417d9ef-ac57-4847-450d-08d822cbc79e
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3447EE1E9D17871D4F9CAB66B6660@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BnGoHUTUwIbOOH11Qsz9qJ1iHdrnDPJOyCLDWZIeM0sqCFykYuDi4Vg3q+zUSB8VJAoMMn8yL5JIWvYgFLqvgSaT8goWio5tA6E9u1lXqcFg9K8BrZBYBL+uvKPen+O5AEp/YHenY8PSqN8ejRlpBsvBZUUcYnRIz69G46638BpA2eToIQVhLDJEfiKmfotsk8PY6qtM7kmqGXU+yLOUdoXVWdVIZTK4aQjfXbsa/TSfilxXYCujjdPu9yUvVsCxAcjqvhq5Hn8pfOp9pSqEFn8LhSSxBDe1QEfeEPq/bK9q2x7SE0E7TFd6vvlmwW9qM0KMFgKklHyGytp/Sdxumt4UIdWWhureVILPB44XTftPjNADyUxIMcnr32HAc8YC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(366004)(376002)(39840400004)(136003)(66446008)(316002)(2906002)(86362001)(110136005)(26005)(6512007)(6486002)(8936002)(478600001)(186003)(4326008)(31686004)(54906003)(76116006)(66476007)(64756008)(66556008)(5660300002)(66946007)(71200400001)(6506007)(2616005)(36756003)(8676002)(53546011)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 205XLu7elnEcjX8RkP4+41WHoKGukav7zkaJ5Au2VSb6wD+iHqtiKHUHhKkPkrltvxzKCgr94b/TEpswp9flo+MAeEFQHJHaZlObZ9u8TegzZ4Id9SqRwM/4dC4jppjHHtpBCy7r/NPQETZxQDi7Nn2yVT/lIbdaFgM6gx8kEPqKRMN89UoSyC8j3QQwBl6wdnlsRU44+gzaZja5OUedPyaD1I4ln/KnqeK2y5Q3KNifHQ5aWKYXtjL3gdatj+UJ4ev3eMOt3BtHA1zBGROoWACuTvNo43zh5WKNs4WNS2rUGCWOXKx5ywhMxXKGuCFow4pTPVeB3OgA4Awj7hASjIjqfm4++m8vjKce5pS9PSWlp5CLalnM0CbEROE37uwQxQCugey5EUJNksB8OKeY6SJP45ZaE06trdCWXbhklAfRYxNzn0P4GKxkw/Cn+ygGqnsKiUmxvuPcekfv56h4DUH5sVeQtCEp3tqejsIwixg=
Content-ID: <3EB1AEB3CCE769448B0A4408266EF745@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7417d9ef-ac57-4847-450d-08d822cbc79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 23:16:29.4739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WgD6TWu3jf+uvHAQs1WPLR/iurYYrxz4OO40yw/S/i1wUZoJSdQeQbaRXN7DN1UCW7Te3ABs7ZWBjK8wgNJwcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_191638_702593_0712E01E 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/7/20 2:32 PM, Joseph Myers wrote:
> On Tue, 7 Jul 2020, Vineet Gupta via Libc-alpha wrote:
> 
>>> Each implementation has it ows requirements so I can't really say if
>>> a helper function does make sense for all of them.  For pause
>>> specifically we can even simplify to since all architectures have
>>> either ppoll or ppoll_time64:
>>>
>>>   int
>>>   __libc_pause (void)
>>>   {
>>>   #ifdef __NR_ppoll_time64
>>>     return SYSCALL_CANCEL (ppoll_time64, NULL, 0, NULL, NULL);
>>>   #else
>>>     return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
>>>   #endif
>>>   }
>>
>> But how is this compatible with older kernels (and perhaps this is a general
>> question). I mean one/more ABIs minimum kernel would not have the ppoll or ppoll64
>> so how will new glibc work with such a kernel ? Is it not required to ?
> 
> See commit 089b772f98afd9eb6264c6489bc96a30bf6af4ac, where I removed 
> __ASSUME_PPOLL because all supported kernel versions now had that syscall 
> for all glibc architectures.

But that still doesn't explain how new glibc works with old kernels (for say when
a port support was first merged, with say asm-generic ABI).

Ah it seems any glibc is only required to work with "arch_minimum_kernel" (generic
or architecture override) which over time itself keeps moving forward due to
various reasons (e.g. 64-bit time support etc). So indeed a bleeding edge glibc of
today won't necessarily work with an arch kernel for say when its glibc port was
first merged, but will for the corresponding arch_minimum_kernel.

> In general this sort of thing needs a review of whether a given syscall is 
> available for all glibc architectures in their minimum kernel versions.  
> For the old kernels in question, that means checking the 
> architecture-specific syscall table as used to dispatch syscalls at 
> runtime, which used to have an architecture-specific format before 
> unification work was done; it used to mean checking asm/unistd.h as well, 
> but now we have syscall tables in glibc that's probably no longer 
> required.  It also involves checking compat syscall tables for 32-bit 
> binaries on 64-bit kernels, as sometimes a syscall didn't get added to the 
> native and compat syscall tables at the same time (see the comments in 
> sparc/kernel-features.h about various socket-related syscalls, for 
> example).
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
