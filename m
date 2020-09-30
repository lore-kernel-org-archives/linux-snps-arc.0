Return-Path: <SRS0=ZTxI=DH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EE9C4363D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 21:39:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3AC20739
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 21:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRZH0E0+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kLAHpZqR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bmS7wdE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3AC20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CQ9tMAfId9Q1UrJ0h69lvoHddMGM/t4FQQzqn/aQtmU=; b=PRZH0E0+DO28RDdqFexyzXrgM
	XKRnao7N8IOPcLfblC5m11b9dzw74WB6txl4mS/cPiGBbWobMxCM5e3jBxE+u4fCRDXTOYKL5gGcW
	5yHRwjUhDNjQWLcAZytlqw5cq+scoiGBsZS5kQoby71j6EsSMUVyVxMjDzb/bhB8FliMWtXbq+H1R
	c/Q9kT8dcOH/M4Fvqo6gVULuW4VMZVyzeE3Y/0/8g08lHH1GUzah56sc+QACpb00GuLv9MJx+dkuF
	7pN8QX+XPqgSz2i5c28FZ4rlT0jD8xx0djOoYCGNm+MaZwBh34D2S54cX+hf4i/rtGDZ53UMGq5AE
	IhhGXChzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNjp4-0002AP-Qm; Wed, 30 Sep 2020 21:39:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNjp2-00029z-MU
 for linux-snps-arc@lists.infradead.org; Wed, 30 Sep 2020 21:39:38 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 57C0CC0785;
 Wed, 30 Sep 2020 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1601501973; bh=MIai60EOiXE+Cc6cyEyr8r0Y1HoaMSz9MXldNy2q4gI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kLAHpZqRgFNp2l4DgEGk0Yr8NzXG+JLnvmW0NBbjVLsDSStxHPSSLTYQATUcXvWDn
 nkygRKghTYTX1wYr9Oro5mRMRYSPM6ZcJP2XHONEwmgwejMPGFa4kkAvd+AE+q/5np
 F7+CP8nS0ygQDsIrE/lxaaLSU9bMGDSIXOYQ0QS/9vYPWhytr9yNDshH74wBDLoxyC
 P7gAPMWhyrephjlg/AX/A3/sgBT2A619cOPOqIf0AVfzXK4gvXrVstw+ltZzDlvMoB
 hc5bOrP+TEghvdVEzxK+4Qxa3s5o6oWdm74hYcTuYhHg7J7SZfn9dUvQQ29ipC9IYB
 HxIsvLezwWfWw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9EFDDA01F1;
 Wed, 30 Sep 2020 21:39:32 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9943D4007C;
 Wed, 30 Sep 2020 21:39:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bmS7wdE4";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze9Rp0M+fopmtgrxO7ajEI0DdmGTOhoLhJO/BA0rTfvLClXTMp8dZ5zew8G4G6/wzXDIvwAhrTvYbtMZh9nNiV8sClqhp5HtrzSJhEjnKOVhji+0C0/1XEcPaoDyTpzdq8WNEqtTzIMxKMZ8H2THCxjVqconGRC58KBRiYku2mMFKwO0ZByuASbd+qlPDUnlIzIC4qY5wGEWQL7T91r70R0zVM+M8oI9oY6lgqYJMeXtYt/bcOzWSCmpvZqAEazYxbwZeeegQbYt4pWcPeL16cvwjy3LpPAyR+6m5Zyl4eUb9g9tHiLtE5E+lwDg0MA2SZfqbEcO/o1KVPnaDQ80LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIai60EOiXE+Cc6cyEyr8r0Y1HoaMSz9MXldNy2q4gI=;
 b=YQoq+6LB94C8VTLAvRcWYcFE+sQYZaDXkYQJHEDVTn93swhBHvw9/pWBAKoxEsxzFTrItUjA3lQhsBXaOsWfuyKYCeX/6838jGMckY4GbuaJG6FY9n64Rsd2D6DzxLdz2W4M/vD6dKvOdAGHyx24uAxyCPXQAbjWYXuDMbBCwawLaGMrNAje3/ks+6gX2DE6hI2Skz9wWWrUYd6JH/mBbdE9Rpttk+bhPdJ8QkfRXb1NneTPSawmI+ObeuZN09wlakxSiRxP1BHJHQDUXw7/RbE2s0GGm+IY08VhTQo+2Jqf3LTaRzrPQWnSOeUEt8EG7JYT7ai8dMtONSnpKrepUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIai60EOiXE+Cc6cyEyr8r0Y1HoaMSz9MXldNy2q4gI=;
 b=bmS7wdE4r4oQUVUJ79MdmENsbXYNAerqp8X+hZBF0oYio7e2z3a/5pvCImYoXos+xcA1Pvaxtum1GOuwYSJbgYgB8z6TSNyx93ajmUgE+IizC2Am6kf7mQlfy5l58qGi/1VeT871jbb6JtGVtiK4s+NIcFdJDNf1fy7lFtilyNc=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4642.namprd12.prod.outlook.com (2603:10b6:a03:1f6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Wed, 30 Sep
 2020 21:39:25 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547%7]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 21:39:25 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Nicolas Pitre <nico@fluxnic.net>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: {standard input}:1174: Error: inappropriate arguments for opcode
 'mpydu' (fwd)
Thread-Topic: {standard input}:1174: Error: inappropriate arguments for opcode
 'mpydu' (fwd)
Thread-Index: AQHWl2/8WJNdAUFXv0yigtpjS8xbyqmBtXMA
Date: Wed, 30 Sep 2020 21:39:25 +0000
Message-ID: <6cb32de8-3e29-12a8-446e-bad65cc2d228@synopsys.com>
References: <nycvar.YSQ.7.78.906.2009301714360.1581@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.78.906.2009301714360.1581@knanqh.ubzr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: fluxnic.net; dkim=none (message not signed)
 header.d=none;fluxnic.net; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 441410bc-9fab-4766-9764-08d865894d65
x-ms-traffictypediagnostic: BY5PR12MB4642:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB464217BE08C4ADDEF38D8845B6330@BY5PR12MB4642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PJveDrgR0CWg+jLYlJD6DM0rkj4a4gXO9KPfS0trWMmOHhFxHKT5ZDlHyOOBEhmLtwrvmAUHIkF0sj0qbrzfMr6sTk4Vdw6nxfi4zxaNTh+6t8UyItkAhvvqxQt5hzN/Tj+HHpOulJdnfJiWOHlH5XWCCe+nEsE4CuRbtoVzPG4eynoyaZkFSHw5tgz8zpIxCU2mwjULOel51AzUkUJbn/J6n3zZNeVs0g7ia99te+LLv5UoRrlUIUzF3zAa8pMznKd7s9grParbA5eXEAc/ZNQOTxgN1YjhWwpBY9VYAvxch0w7Wr9ybRu3T1jI692QN5BMiMdSm1eZTeRF3y3gqGBDvRikhBBYAq1KpTP1Zs5MDnUvIiFN/xM0tBPGyAodSIOrqKL7LxyfHpcmC9QUZHFbc9FI3Ai0mmbZzhwhDW9c/8EdGp8WauDyuL7sKhJBJEEKul3bIr1ZF6f3/o6aYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(110136005)(54906003)(83080400001)(186003)(316002)(2616005)(6636002)(478600001)(966005)(36756003)(8936002)(76116006)(107886003)(5660300002)(71200400001)(2906002)(86362001)(31686004)(31696002)(26005)(64756008)(66446008)(83380400001)(66556008)(6506007)(53546011)(6512007)(66476007)(6486002)(66946007)(8676002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +K5LDKSRMTeZb6LZpO4qrzrufg7P7VnT6yixlNlhg6z1KidBIJGMKnXPLsLgLwJk3wqvDDSnnbkodbecEGtCphZaWl0Yys7wgjqKuDZB7M0Z+vTuzbdfjvuFdEZdVYlygdoq+maVGNy8OkKq1J8ljEjpnJDp+reHsG6Im8czm6/RM9mlpaFBA6d6Gn6iP7sU2DzqKth4EOA3iYk519IDns3aLGjBbVLR8q7AECrN4IME4imy+7mNaJZQBagNo+MMa2CzrlQVJF5ZDrcLJKmyRyQg+T8zZlwnjyLDeMbMdMwAe5F8wM+AEth8KosN6ADbJ2RLu78/CYjvkPq5yMER/YPQeRKTzyFYTtF+EDVBjQovLYzlXMnL4yqg+AHqFQDbrQ7+Br+UPLgDh9MJx9MzdrC0Vsdd+igweqjep4VKg+wG7KuoHHJFxbrRwGtgKucHA2rf4meBqbvWe292k8A1rQeZXLXFZbo94msty8iDEjeW+XI4OAVfTbTLcYBuoqs+3tR+OMQrgUYz9I7VRJScUsY1HbEthTx1hjG4K/8WiYkNTtIn9hFgQgjnXfA84x09fWNofRbCvsqdN3OTKU0fk+mc2Oui8zRyvIscN4GdGcE19kIEfAHGfDQL7D/a3rd3xhfWxwwFZPnc58D0CHRWYg==
Content-ID: <11089F525B72344C9D0C7BF5252977F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441410bc-9fab-4766-9764-08d865894d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 21:39:25.4484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwHtooH+TQdhiqM8C3yImft3KDG03WmsS8KVSkVzltJjdH4TlTAQqg3kvdmFuMF8shAD049d8X9HrBc49tZdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_173937_141671_DFF3E686 
X-CRM114-Status: GOOD (  26.02  )
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
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On 9/30/20 2:23 PM, Nicolas Pitre wrote:
> Hello,
>
> I just realized you might not be aware of the following issue.
>
> The kernel kbuild test robot project identified a build failure on ARC 
> that bisects down to a patch of mine. 

Your patch to Linux kernel ? Indeed the report we got for build failure didn't
provide that context and we will appreciate pointers to same just for curiosity.

> It turns out that my patch is 
> highlighting a bug in gcc for ARC.

In any case, we did reach the same conclusion it is indeed an ARC gcc bug (for Big
endian builds only) and have created a github ticket for our gcc maintainer to
resolve. Please note that we've not seen it internally as Big Endian is an
optional configuration option and not in wide spread use for us.

https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/300


And we can also confirm this is seen in gcc 9 and gcc 10 both.

Thx,
-Vineet

>
> ---------- Forwarded message ----------
> Date: Mon, 28 Sep 2020 17:43:20 -0400 (EDT)
> From: Nicolas Pitre <nico@fluxnic.net>
> To: Rong Chen <rong.a.chen@intel.com>
> Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
>     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, gcc@gcc.gnu.org
> Message-ID: <nycvar.YSQ.7.78.906.2009281705410.1581@knanqh.ubzr>
> Subject: Re: {standard input}:1174: Error: inappropriate arguments for opcode
>     'mpydu'
>
> On Sun, 27 Sep 2020, Rong Chen wrote:
>
>> Hi Nicolas,
>>
>> Thanks for the feedback, the error still remains with gcc 10.2.0:
> I've created the simplest test case that can be. You won't believe it.
>
> Test case:
>
> $ cat test.c
> unsigned int test(unsigned int x, unsigned long long y)
> {
> 	y /= 0x20000000;
> 	if (x > 1)
> 		y *= x;
> 	return y;
> }
> $ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/0day/gcc-9.3.0-nolibc/arc-elf/libexec/gcc/arc-elf/9.3.0
> $ ~/0day/gcc-9.3.0-nolibc/arc-elf/bin/arc-elf-gcc -mcpu=hs38 -mbig-endian -O2 -c test.c
> /tmp/cc0GAomh.s: Assembler messages:
> /tmp/cc0GAomh.s:21: Error: inappropriate arguments for opcode 'mpydu'
>
> I know nothing about ARC. Please anyone take it over from here.
>
>
> Nicolas

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
