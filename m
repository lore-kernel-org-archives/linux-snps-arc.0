Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F552C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31803207DD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZMeayBN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D8n/eFfX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CIb/Gs71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31803207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=as7Jk6jdOcQNObK87Zr1EJTeB7EtzE5HhnYpoviLnrA=; b=XZMeayBNm/ozEQrVxj5AmrC7b
	3Gvi1OtJ2ioZ4gZAM4v20EZy9+W4qWiGa34RNl/gjFWs5Zk3lhcINiEJvSLtR2LWpmBREOqsQ6gOg
	lkgrhFGtBXOHv8unSfaPnC6j1TmGMptlhIoje3phUWPcPxVEsnwe3EO0mWgoF1K86p2nTDAUIXX3c
	rQRxmrzYnkGA9DJGaH+P2lNDvT8rm1nHg21fCzMPU4CjjC34EbEa1F5PiJ9cSg4lP6NdFziiWAFuF
	GUnmniEKVN6c7aE2SObwcJM7bXKzqg59jTIEv2bljvi3gbX2QMYZ36G3xQrakFwJlSiNTJb8krz1w
	iR2axgc7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtZLg-0004be-K8; Thu, 09 Jul 2020 16:24:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZLd-0004aP-RI
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 16:24:35 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9262740B60;
 Thu,  9 Jul 2020 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594311869; bh=QTG+daSdT5b8q9KeZKCYqOawHCNVMx9l+oJP47k1/EE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=D8n/eFfXe3e70LpPhFi6PoP+EIGUAA1TPJ08juJVYRRHTCNrWU/AnJsfJJKNKdnmP
 4QUzFeqtJd2MaWxQ9MOtjs5AQcaNTl7UM/HOLB2g23GqvIrXKX0yRoxaYkCmeYnO4X
 dKvKDXw5djW2z2dT7tpVFnmGHuThUH/UB4I+xK2PMl5Nym3rDyZ7qMHirdVu0o8ytL
 vUJkU9UCKSDilycXKtRUqbm/mwidj3ezQS96OW2dvC+wK0WX6AHE1xN9n//ydf6Z0/
 h5kU6MBHoCfEUYc+dn8UdCMiTFCjJIODUXE0ZOK2UGiAKieD6RUrQr5iP80psZDbeq
 s/92udagsnsdA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 82C6BA005C;
 Thu,  9 Jul 2020 16:24:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01DCC40140;
 Thu,  9 Jul 2020 16:24:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CIb/Gs71";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncc1iul2B4jF0MmX2+udeglwxvaXkdC8poHZod5bmUR0vpp8BSl40CfXI2WbTe7fqT4H3Gz3WXiEnXJA6s8RTBqLxbblIK7/2O6u+3VVjgkycx7dpHlPAsOssEJbfKhUm+h/rC8g0Ltthxem9iOVZ0x8wHeHwJo11XKJcJ0qFq6WyWbws+Mg/5jYGORqub3119mRD+OhO7j9aTfA3jYys7GAEBMP1Zgr8ZESwLbfuioEE9XxVeECgaW15qTVgS1sn6PA7If8xT3gPDpk5uZk7nZ+ZG0NhrR7gPpOiXyi1EHkM6SKcamFA0BN7nbW8d5eyUs+S8b9OfyroGZOXevJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTG+daSdT5b8q9KeZKCYqOawHCNVMx9l+oJP47k1/EE=;
 b=d/kfQLU0LI/4M2CpO6bdm5YOAhb/YDWaF3yNLmRY19EShTpMlw6xffk0zcN3up0lJZwV07BJaylBEBcl+NEBV2E4N/ywb2UtQKanWOakKIYfWiQufyreqCLAlBfmAsUc87b7RHkRxRev4EPVAeYfM/dRLYsOqepHa4a+y1EClfM7YXbTbfcRY9gKb6se+AQaYqDOQW+46rp6prKt3z75sK8D6PeZa81o89chfEl8HIdLTLI56tOQl2k6APb4FVsB6Ucci/2XUhWEFpINLGb1HJ/Gymo/XRlVan0p9FEPuptNdfz0dAtoqk1kl1OJcYOOBBsPJXy5qcLWTIUT3Gd77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTG+daSdT5b8q9KeZKCYqOawHCNVMx9l+oJP47k1/EE=;
 b=CIb/Gs71b7DK9Meq16MrAYBJXFNXZScSF6UGo+hIKnqROcw3xI77w9WvTiRTPS91q8IESGrFjiDmJxWUmQaJcLt1s1s1JtVuGPUnT0KgfsJW8MQhxTEaOsMpFVDoqyahYQ/Ek2fj2TTJEo3gPkq+/ofHCFWd5TJCnzPwntIQaLk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 16:24:25 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 16:24:25 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWVKDp5vld8QE1SUOqPd+g+I3Df6j/a8gAgAAFxgA=
Date: Thu, 9 Jul 2020 16:24:25 +0000
Message-ID: <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
In-Reply-To: <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab5b6ad-7d84-4309-4b49-08d824248b9c
x-ms-traffictypediagnostic: BY5PR12MB4147:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB414748DF1C75F3C8830A0645B6640@BY5PR12MB4147.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nuYAFIAreuTPMA1Ma9Pyoy1oqCPzCH3TBuzOI10ht4FRqarWXRu54tlpCeR7O1wusSeszAB0E34dykbOZXRW0IcFqTe0iCn3owIzVgo+2K6fNTchquJipzn4TdKVrmDuN0D+cM0uNKNcj7Vrcfv52d9YnmJvsxlVW2EKRdpRQT7LyJ/iOEhnniY4T5bTpees3KqJUbSuvh/xU8p6VA5BftagwttBVUg8k6RbtPhPGzwtg+9MdmaJKTdB//xGL7CzJVfFh2vzmFqZ/psgfqbYz4uGa55hrp1tKbRAgDJGYLYSGGaRS/741j/DsN8am1sYMlLhbMd2BnkPQCusHqZ3rk+bys8AtJC5VpqDK1oF5kAIWd4ct2IEq8b420oX8vfj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(39860400002)(366004)(396003)(64756008)(66556008)(186003)(31686004)(6486002)(6506007)(53546011)(2616005)(83380400001)(4326008)(66476007)(8936002)(36756003)(6512007)(86362001)(31696002)(110136005)(66446008)(316002)(5660300002)(71200400001)(76116006)(478600001)(2906002)(66946007)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CVv0Y7E6FjKiYpB4JvpJ92qDy3hVLOJb9jtEPTI+67SeAW+7Zg80Bgrcc0/Ki+CgKp8IlUN+UAuH7EUob68vzyxPCzqNXjft2GKTI98HGoHP5ZlVvulvuDR4w3L8O5laVV///MnFP906xq28vll2O3H9piSEXSIOR/MAM07aeYugODgkNV5dnYFXLHVxq7ar8cPy7NlwpZ9zb/UbOStyVAwKVxxFPSPuWBw/u8zNnxtGpsml5Fvy0UWtip1b/9k/OUZcHjkJYMUbhBEZQWyXsZODDwGezuffkkxFqgVUQf4tn7i7EOEi2BU8uqW6GWKFjK7KR0Sll5vtCUCAW4mzSILHk6uuAN7fDbGxo6lAOKlfWqdZvRVbZzMk2ZjK9Jwn050f/lEg8dRTP9GUQaMJ7BhUV3C31j8mhDMtnUTgl0UDw6sRYt4gLA7iWes2gyH9/7POr4MJ+hV/HFurq6J685nwMD70vDMXmdaAEkVa9NkdCFGSX13uvE0w/it492fpJnHx9FN/lkasSjCLgCeC46xbhbDqxYJrStVOT6RgdMjF4957ZzGn33zA6oTDiDHd
Content-ID: <6BD3BD4D9D2C9547BB197C94417F94DD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab5b6ad-7d84-4309-4b49-08d824248b9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 16:24:25.0604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyn0NUaSnEh3TsNfL+K0VdDLqtRJU3GXIODWxl0d5KPKK0LhkhGXkHUF21a/W0nAa/flJqlnvPmZiBMSfZXakQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_122434_262394_A7213CBD 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/9/20 9:03 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 08/07/2020 16:32, Vineet Gupta wrote:
>> On 7/8/20 9:31 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>
>>> On 07/07/2020 17:55, Vineet Gupta via Libc-alpha wrote:
>>>> ---
>>>>    Changes since v7.1:
>>>>      - Added a few more 32-bit time_t syscalls to fixup-asm-unistd.h
>>>>        and regen arch-syscall.h to remove them: __NR_timer{g,s}ettime,
>>>>        __NR_clock_{gettime,nanosleep,settime}
>>>>      - minimal/annotated list of 32-bit syscall aliases in ARC sysdeps.h
>>>>        for 64-bit time_t support
>>>>      - Open-coded SYS_ify() but retained the macro as used by common
>>>>        code
>>>>      - No functional changes in generated dsos.
>>>>    Changes since v7:
>>>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
>>> LGTM, thanks.
>>>
>>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>>
>> Thx a lot. I now have Reviewed-by tags on all ARC patches so we just need the
>> sysvipc/semctl y2038 patches to hit upstream before I can commit.
> 
> The patches are in, if you could just to a sanity check I will
> be grateful. 

Thx.

Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
abilist updates). Will do a full testsuite run and if thats same as before, I'm
good to push ARC port ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
